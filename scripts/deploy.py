from brownie import accounts, config, network

# Import a contract
from brownie import SimpleStorage

# NOTE: If we wish to add a metamask account to brownie, can see all with brownie accounts list
# brownie accounts new NAME, then paste key, with 0x
# NOTE: SETUP: brownie init

def deploy_simple_storage():
    # To load account from ganache
    account = get_account()

    # To load from .env, either
    # account = accounts.add(os.getenv("PRIV_TEST_KEY"))
    # account = accounts.add(config["wallets"]["from_key"])

    # To load from stored brownie account
    # account = accounts.load("metamask1")

    # Deploy the contract, saying which account it comes from
    simple_storage = SimpleStorage.deploy({"from": account})
    
    # As a view function, don't need to add from as don't need transaction
    stored_value = simple_storage.retrieve()
    print(stored_value)

    # Update the value
    transaction = simple_storage.store(15, {"from": account})
    # Wait for num blocks to wait for
    transaction.wait(1)

    stored_value = simple_storage.retrieve()
    print(stored_value)

def get_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_simple_storage()