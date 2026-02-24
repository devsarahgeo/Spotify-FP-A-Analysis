from utils import GCSUploader
from .api.spotify_fetch_data import get_tracks, get_playlists, get_podcasts, get_new_releases, get_artist, get_playlist_details_parallel, get_podcast_details_parallel, extract_unique_artist_ids

bucket_name = "fpa-analysis"

tracks = get_tracks(query=["pop", "rock", "hip-hop"], limit_per_call=50, max_items=10000)
print(f"Fetched {len(tracks)} tracks")

artist_ids = extract_unique_artist_ids(tracks)
artists_data = get_artist(artist_ids)
print(f"Fetched {len(artists_data)} artists")

playlists = get_playlists(query=["pop", "rock", "hip-hop"], limit_per_call=50, max_items=10000)
print(f"Fetched {len(playlists)} playlists")

playlist_details = get_playlist_details_parallel(playlists)
print(f"Fetched {len(playlist_details)} playlist details")

podcasts_genres = ["business", "technology", "comedy"]
podcasts = get_podcasts(podcasts_genres, limit_per_call=50, max_items=10000)
print(f"Fetched {len(podcasts)} podcasts across {len(podcasts_genres)} queries")

podcast_details = get_podcast_details_parallel(podcasts)
print(f"Fetched {len(podcast_details)} podcast details")

new_releases = get_new_releases(limit_per_call=50, max_items=10000)
print(f"Fetched {len(new_releases)} new_releases queries")

uploader = GCSUploader()
datasets = {
    "tracks": tracks,
    "artists": artists_data,
    "playlists": playlists,
    "playlist_details": playlist_details,
    "podcasts": podcasts,
    "podcast_details": podcast_details,
    "new_releases": new_releases
}

for name, data in datasets.items():
    if data:   
        uploader.upload_json(data, name)
    else:
        print(f"Skipped {name} (no data)")



