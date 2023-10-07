// Copyright (c) 2016-2021 The Bitcoinnickel Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINNICKEL_WALLET_RPC_WALLET_H
#define BITCOINNICKEL_WALLET_RPC_WALLET_H

#include <span.h>

class CRPCCommand;

namespace wallet {
Span<const CRPCCommand> GetWalletRPCCommands();
} // namespace wallet

#endif // BITCOINNICKEL_WALLET_RPC_WALLET_H
