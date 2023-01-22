from brownie import SimpleStorage, accounts, config

def read_contract():
    # Get the most recently deployed contract
    simple_storage = SimpleStorage[-1]
    print(simple_storage.retrieve())


def main():
    read_contract()