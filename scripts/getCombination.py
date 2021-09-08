#!/usr/bin/env python3

# ==============================================================================
# 
import freeton_utils
from   freeton_utils import *
import time
import sys
from   pprint import pprint

# ==============================================================================
# 
MESSAGE_ID = "2da272701da0179f83a0d55f73d1ea7c6768b61e506e3ff8e777fea2df34cb86" # example message ID of lottery #11

# ==============================================================================
#
def getClient():
    return TonClient(config=ClientConfig(network=NetworkConfig(endpoints=getApiEndpoints(testnet=False))), is_core_async=True)

# ==============================================================================
# 
def printTicket(ticket: int, numbersMatched: int = 0):
    print(ticket >> 40 & 0xFF, ticket >> 32 & 0xFF, ticket >> 24 & 0xFF, ticket >> 16 & 0xFF, ticket >> 8 & 0xFF, ticket & 0xFF, f"(matched {numbersMatched})" if numbersMatched > 0 else "")

# ==============================================================================
# 
messages = unwrapMessages(tonClient=getClient(), messageIdArray=[MESSAGE_ID], abiFilesArray=["../bin/Lottery.abi.json", "../bin/LotteryGenerator.abi.json"])
for msg in messages:
    if msg["FUNCTION_NAME"] == "callbackGenerateWinningCombination":
        ticket = int(msg["FUNCTION_PARAMS"]["number"])
        printTicket(ticket)