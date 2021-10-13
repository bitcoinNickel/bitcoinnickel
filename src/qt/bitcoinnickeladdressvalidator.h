// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINNICKEL_QT_BITCOINNICKELADDRESSVALIDATOR_H
#define BITCOINNICKEL_QT_BITCOINNICKELADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BitcoinNickelAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinNickelAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** BitcoinNickel address widget validator, checks for a valid bitcoinnickel address.
 */
class BitcoinNickelAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinNickelAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BITCOINNICKEL_QT_BITCOINNICKELADDRESSVALIDATOR_H
