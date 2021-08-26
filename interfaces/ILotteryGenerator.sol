pragma ton-solidity >= 0.47.0;
pragma AbiHeader time;
pragma AbiHeader pubkey;
pragma AbiHeader expire;

//================================================================================
//
interface ILotteryGenerator
{
    //========================================
    // 
    function     generateNumbers(uint8 rows, uint8 columns, uint8 limit) external pure             returns (uint64[] numbers);
    function callGenerateNumbers(uint8 rows, uint8 columns, uint8 limit) external view responsible returns (uint64[] numbers);
    function      generateSingle(uint8 columns, uint8 limit)             external pure             returns (uint64   number );
    function  callGenerateSingle(uint8 columns, uint8 limit)             external view responsible returns (uint64   number );
}

//================================================================================
//