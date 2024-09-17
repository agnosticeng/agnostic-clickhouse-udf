with
    q0 as (
        select 
            log.topics::Array(String),
            log.data::String,
            'Transfer(indexed address, indexed address, uint256)' as abi
        from file('./tmp/evm_blocks/*.parquet')
        array join transactions as tx 
        array join tx.receipt.logs as log
        where length(log.topics) == 3
        and log.topics[1] = keccak256('Transfer(address,address,uint256)')
    )

select * from q0 limit 10