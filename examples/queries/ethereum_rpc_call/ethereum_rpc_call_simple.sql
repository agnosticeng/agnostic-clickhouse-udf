select 
    JSONExtractString(
        ethereum_rpc_call('0xdAC17F958D2ee523a2206206994597C13D831ec7', 'symbol()(string)', '', -1::Int64, ''),
        'value',
        'arg0'
    ) as symbol,
    JSONExtractUInt(
        ethereum_rpc_call('0xdAC17F958D2ee523a2206206994597C13D831ec7', 'decimals()(uint8)', '', -1::Int64, ''),
        'value',
        'arg0'
    ) as decimals