select 
    * 
from executable(
    'clickhouse-evm table-function ethereum-rpc-filter eth_newFilter --endpoint=https://eth.llamarpc.com',
    Native, 
    'result String', 
    (
        select toJSONString(map(
            'fromBlock', evm_hex_encode_int(20000000),
            'toBlock', evm_hex_encode_int(20000010),
            'address', '0x88e6a0c2ddd26feeb64f039a2c41296fcb3f5640'
        )) as filter
    )
)

    