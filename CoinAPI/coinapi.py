import os
import sys
import json
import requests

from tqdm import tqdm

established_coins = ["BTC", "ETH", "BNB", "ADA", "DOT", "UNI", "LTC", "LINK", "VET", "XLM"]
baby_coins = ["DENT", "REN", "VGX", "AR", "1INCH", "XVG", "CRV", "PROM", "CFX", "LSK"]


def load_keys(keys_path="../private/keys.json"):
    return json.load(open(keys_path))


def retrieve_data(keys, data_dir="../private/"):
    current_key = 1
    headers = {"X-CoinAPI-Key": keys[str(current_key)]}
    base_url = "http://rest.coinapi.io/v1/ohlcv/{}/USD/history?period_id=12HRS&time_start={}" \
               "&include_empty_items=true&limit=100000"
    start_date = "2010-01-01T08:00:00.000Z"
    established_coins_data = {}
    for coin in tqdm(established_coins):
        response = requests.get(base_url.format(coin, start_date), headers=headers)
        while response.status_code == 429 and current_key < len(keys):
            current_key += 1
            headers = {"X-CoinAPI-Key": keys[str(current_key)]}
            response = requests.get(base_url.format(coin, start_date), headers=headers)

        if current_key == len(keys) and response.status_code == 429:
            print("We are out of requests, try back later...")
            partial_est_path = os.path.join(data_dir, "partial_established_coin_data.json")
            json.dump(established_coins_data, open(partial_est_path, 'w+'))
            sys.exit()

        established_coins_data[coin] = response.json()
    established_data_path = os.path.join(data_dir, "established_coin_data.json")
    json.dump(established_coins_data, open(established_data_path, 'w+'))

    baby_coin_data = {}
    for coin in tqdm(baby_coins):
        response = requests.get(base_url.format(coin, start_date), headers=headers)
        while response.status_code == 429 and current_key < len(keys):
            current_key += 1
            headers = {"X-CoinAPI-Key": keys[str(current_key)]}
            response = requests.get(base_url.format(coin, start_date), headers=headers)

        if current_key == len(keys) and response.status_code == 429:
            print("We are out of requests, try back later...")
            partial_baby_keys_path = os.path.join(data_dir, "partial_baby_coin_data.json")
            json.dump(baby_coin_data, open(partial_baby_keys_path, 'w+'))
            sys.exit()
        baby_coin_data[coin] = response.json()

    baby_coin_path = os.path.join(data_dir, "baby_coin_data.json")
    json.dump(baby_coin_data, open(baby_coin_path, 'w+'))


def retrieve_asset_data(keys, file_save="../private/asset_data.json"):
    if os.path.isfile(file_save):
        return json.loads(open(file_save).read())
    else:
        headers = {"X-CoinAPI-Key": keys['key']}
        base_url = "https://rest.coinapi.io/v1/assets"

        response = requests.get(base_url, headers=headers)

        with open(file_save, 'w') as f:
            json.dump(response.json(), f)

        return response.json()


def main():
    keys = load_keys()

    retrieve_data(keys)


def print_coins(coins):
    i = 0
    for coin in coins:
        print(coin['asset_id'])
        i += 1
        if i > 10:
            break


if __name__ == '__main__':
    if not os.path.isdir("../private"):
        print(
            "You do not have the keys present, get the keys and place them in the private folder with the filename "
            "\"keys.json\"")
        exit = False
        try:
            os.mkdir("../private")
            exit = True
        except FileExistsError:
            pass
        except:
            print("Fatal error making '../private'")
            sys.exit()

        if exit:
            sys.exit()

    main()
