import requests
import os
from dotenv import load_dotenv
from datetime import datetime, timedelta

load_dotenv()

client_id = os.getenv("SPOTIFY_CLIENT_ID")
client_secret = os.getenv("SPOTIFY_CLIENT_SECRET")

TOKEN_URL = "https://accounts.spotify.com/api/token"

# Global token cache
_access_token = None
_token_expiry = None


def get_access_token():
    global _access_token, _token_expiry

    # If token exists and not expired, reuse it
    if _access_token and _token_expiry:
        if datetime.now() < _token_expiry:
            return _access_token

    # else request new token
    response = requests.post(
        TOKEN_URL,
        data={
            "grant_type": "client_credentials",
            "client_id": client_id,
            "client_secret": client_secret,
        },
        headers={"Content-Type": "application/x-www-form-urlencoded"},
    )

    response.raise_for_status()
    token_data = response.json()

    _access_token = token_data["access_token"]

    # Expiry time (subtract 60s buffer for safety)
    expires_in = token_data["expires_in"]
    _token_expiry = datetime.now() + timedelta(seconds=expires_in - 60)

    return _access_token


# print("Access Token:", get_access_token())