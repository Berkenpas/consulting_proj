import os
import sys
import json
import requests

established_coins = ["BTC", "ETH", "BNB", "ADA", "DOT", "UNI", "LTC", "LINK", "VET", "XLM"]
baby_coins = ["AKT", "BAO", "AOA", "RBC", "DAG", "BFC", "MUSH", "FORTH", "ATT", "BNANA"]

def load_keys(keys_path="../private/keys.json"):
    return json.load(open(keys_path))


def retrieve_data(keys):
    headers = {"X-CoinAPI-Key": keys['key']}
    base_url = "http://rest.coinapi.io/vi/ohlcv/periods/"


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

    coins = retrieve_asset_data(keys)
    print_coins(coins)


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
