import requests
import os
from dotenv import load_dotenv
from .auth import get_access_token
from concurrent.futures import ThreadPoolExecutor, as_completed

load_dotenv()

access_token = os.getenv("SPOTIFY_ACCESS_TOKEN")

BASE_URL = "https://api.spotify.com/v1"
access_token = get_access_token()
headers = {"Authorization": f"Bearer {access_token}"}

def get_tracks(query=["pop", "rock", "hip-hop"], limit_per_call=50, max_items=None):
    """
    Fetch all tracks for a given query with pagination.
    
    Args:
        query (str): Search term / genre
        limit_per_call (int): Number of items per API call (max 50)
        max_items (int, optional): Max items to fetch (None = all available)
    
    Returns:
        list: List of track objects
    """
    all_tracks = []
    fetched = 0

    while True:
        url = f"{BASE_URL}/search?q={query}&type=track&limit={limit_per_call}&offset={fetched}"
        res = requests.get(url, headers=headers).json()
        
        items = res.get("tracks", {}).get("items", [])
        if not items:
            break  
        for track in items:
            track["query"] = query

        all_tracks.extend(items)
        fetched += len(items)

        # Stop if we've reached max_items limit
        if max_items and fetched >= max_items:
            all_tracks = all_tracks[:max_items]  
            break
        
        # Stop if fewer items returned than limit_per_call
        if len(items) < limit_per_call:
            break

    return all_tracks

def extract_unique_artist_ids(tracks):
    artist_ids = set()

    for track in tracks:
        for artist in track.get("artists", []):
            if artist and artist.get("id"):
                artist_ids.add(artist["id"])

    return list(artist_ids)

def get_artist(artist_ids, batch_size=30):
    all_artists = []

    for i in range(0, len(artist_ids), batch_size):
        batch = artist_ids[i:i+batch_size]
        ids_string = ",".join(batch)

        url = f"{BASE_URL}/artists?ids={ids_string}"
        response = requests.get(url, headers=headers)

        # Check status code before parsing JSON
        if response.status_code != 200:
            print(f"Error {response.status_code}: {response.text}")
            continue

        res = response.json()
        artists = res.get("artists", [])

        for artist in artists:
            if artist:
                all_artists.append(artist)

    return all_artists


def get_playlists(query=["pop", "rock", "hip-hop"], limit_per_call=50, max_items=None):

    all_playlists = []

    for q in query:
        fetched = 0

        while True:
            url = f"{BASE_URL}/search?q={q}&type=playlist&limit={limit_per_call}&offset={fetched}"
            res = requests.get(url, headers=headers).json()

            items = res.get("playlists", {}).get("items", [])
            if not items:
                break

            count_this_batch = 0

            for playlist in items:
                if playlist is None:
                    continue
                playlist["query"] = q
                all_playlists.append(playlist)
                count_this_batch += 1

            fetched += count_this_batch

            if max_items and fetched >= max_items:
                break

            if len(items) < limit_per_call:
                break

    return all_playlists

def get_playlist_details(playlist_id):
    url = f"{BASE_URL}/playlists/{playlist_id}"
    return requests.get(url, headers=headers).json()

def get_playlist_details_parallel(playlists, max_workers=8):
    playlist_details = []

    def fetch_playlist(p):
        return get_playlist_details(p["id"])

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = [executor.submit(fetch_playlist, p) for p in playlists]

        for future in as_completed(futures):
            try:
                result = future.result()
                if result:
                    playlist_details.append(result)
            except Exception as e:
                print(f"Error fetching playlist: {e}")

    return playlist_details

def get_podcasts(queries=["business", "technology", "comedy"], limit_per_call=20, max_items=None):
    all_shows = []

    for query in queries:
        fetched = 0

        while True:
            url = f"{BASE_URL}/search?q={query}&type=show&limit={limit_per_call}&offset={fetched}"
            res = requests.get(url, headers=headers).json()

            items = res.get("shows", {}).get("items", [])
            if not items:
                break

            count_this_batch = 0

            for show in items:
                if show is None:
                    continue
                show["query"] = query
                all_shows.append(show)
                count_this_batch += 1

            fetched += count_this_batch

            # Stop if max_items reached (per query)
            if max_items and fetched >= max_items:
                break

            if len(items) < limit_per_call:
                break

    return all_shows

def get_podcast_details(show_id):
    url = f"{BASE_URL}/shows/{show_id}"
    res = requests.get(url, headers=headers)

    if res.status_code != 200:
        print(f"Error fetching podcast {show_id}: {res.status_code} - {res.text}")
        return None

    try:
        return res.json()
    except ValueError:
        print(f"Error parsing JSON for podcast {show_id}")
        return None
    
    
def get_podcast_details_parallel(shows, max_workers=5):
    podcast_details = []

    def fetch_show(show):
        return get_podcast_details(show["id"])

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = [executor.submit(fetch_show, show) for show in shows]

        for future in as_completed(futures):
            try:
                result = future.result()
                if result:
                    podcast_details.append(result)
            except Exception as e:
                print(f"Error fetching podcast: {e}")

    return podcast_details


def get_new_releases(limit_per_call=20, max_items=None):
    all_albums = []
    fetched = 0

    while True:
        url = f"{BASE_URL}/browse/new-releases?limit={limit_per_call}&offset={fetched}"
        res = requests.get(url, headers=headers).json()

        items = res.get("albums", {}).get("items", [])
        if not items:
            break

        count_this_batch = 0

        for album in items:
            if album is None:
                continue
            all_albums.append(album)
            count_this_batch += 1

        fetched += count_this_batch

        if max_items and fetched >= max_items:
            break

        if len(items) < limit_per_call:
            break

    return all_albums












