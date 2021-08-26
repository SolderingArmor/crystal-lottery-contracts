pragma ton-solidity >= 0.47.0;
pragma AbiHeader time;
pragma AbiHeader pubkey;
pragma AbiHeader expire;

//================================================================================
//
import "../interfaces/ILotteryGenerator.sol";
import "../interfaces/IOwnable.sol";

//================================================================================
//
contract LotteryGenerator is IOwnable, ILotteryGenerator
{
    //========================================
    // 
    constructor(address ownerAddress) public
    {
        tvm.accept();
        _ownerAddress = ownerAddress;
    }

    //========================================
    // 
    function _generateNumbers(uint8 rows, uint8 columns, uint8 limit) internal pure returns (uint64[] numbers)
    {
        numbers = new uint64[](rows);

        for(uint8 i = 0; i < rows; i++)
        {
            rnd.shuffle();
            for(uint8 k = 0; k < columns; k++)
            {
                rnd.shuffle();
                numbers[i] |= (uint64(rnd.next(limit)) << uint64(k) * uint64(8));
            }
        }
    }

    //========================================
    // 
    function generateNumbers(uint8 rows, uint8 columns, uint8 limit) external pure override returns (uint64[] numbers)
    {
        numbers = _generateNumbers(rows, columns, limit); 
    }

    function callGenerateNumbers(uint8 rows, uint8 columns, uint8 limit) external view override responsible reserve returns (uint64[] numbers)  
    {
        numbers = _generateNumbers(rows, columns, limit);
        return {value: 0, flag: 128}(numbers);
    }

    //========================================
    // 
    function generateSingle(uint8 columns, uint8 limit) external pure override returns (uint64 number)
    {
        uint64[] numbers = _generateNumbers(1, columns, limit); 
        return(numbers[0]);
    }

    function callGenerateSingle(uint8 columns, uint8 limit) external view override responsible reserve returns (uint64 number)
    {
        uint64[] numbers = _generateNumbers(1, columns, limit);
        return{value:0, flag:128}(numbers[0]);

    }
}

//================================================================================
//