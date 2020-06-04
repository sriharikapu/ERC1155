/**
 *Submitted for verification at Etherscan.io on 2020-06-04
*/

pragma solidity ^0.5.0;

// SPDX-License-Identifier: Creative Commons
// @author: sriharikapu

/**
 * @dev Collection of functions related to the address type,
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * This test is non-exhaustive, and there may be false-negatives: during the
     * execution of a contract's constructor, its address will be reported as
     * not containing a contract.
     *
     * > It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts may inherit from this and call {_registerInterface} to declare
 * their support of an interface.
 */
contract ERC165 is IERC165 {
    /*
     * bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
     */
    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;

    /**
     * @dev Mapping of interface ids to whether or not it's supported.
     */
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor () internal {
        // Derived contracts need only register support for their own interfaces,
        // we register support for ERC165 itself here
        _registerInterface(_INTERFACE_ID_ERC165);
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     *
     * Time complexity O(1), guaranteed to always use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) public view  returns (bool) {
        return _supportedInterfaces[interfaceId];
    }

    /**
     * @dev Registers the contract as an implementer of the interface defined by
     * `interfaceId`. Support of the actual ERC165 interface is automatic and
     * registering its interface id is not required.
     *
     * See {IERC165-supportsInterface}.
     *
     * Requirements:
     *
     * - `interfaceId` cannot be the ERC165 invalid interface (`0xffffffff`).
     */
    function _registerInterface(bytes4 interfaceId) internal  {
        require(interfaceId != 0xffffffff, "ERC165: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

/**
    @title ERC-1155 Multi Token Standard basic interface
    @dev See https://eips.ethereum.org/EIPS/eip-1155
 */
contract IERC1155 is IERC165 {
    event TransferSingle(address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);

    event TransferBatch(address indexed operator, address indexed from, address indexed to, uint256[] ids, uint256[] values);

    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    event URI(string value, uint256 indexed id);

    function balanceOf(address owner, uint256 id) public view returns (uint256);

    function balanceOfBatch(address[] memory owners, uint256[] memory ids) public view returns (uint256[] memory);

    function setApprovalForAll(address operator, bool approved) external;

    function isApprovedForAll(address owner, address operator) external view returns (bool);

    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes calldata data) external;

    function safeBatchTransferFrom(address from, address to, uint256[] calldata ids, uint256[] calldata values, bytes calldata data) external;
}

/**
    @title ERC-1155 Multi Token Receiver Interface
    @dev See https://eips.ethereum.org/EIPS/eip-1155
*/
contract IERC1155TokenReceiver is IERC165 {

    /**
        @dev Handles the receipt of a single ERC1155 token type. This function is
        called at the end of a `safeTransferFrom` after the balance has been updated.
        To accept the transfer, this must return
        `bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"))`
        (i.e. 0xf23a6e61, or its own function selector).
        @param operator The address which initiated the transfer (i.e. msg.sender)
        @param from The address which previously owned the token
        @param id The ID of the token being transferred
        @param value The amount of tokens being transferred
        @param data Additional data with no specified format
        @return `bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"))` if transfer is allowed
    */
    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external
        returns(bytes4);

    /**
        @dev Handles the receipt of a multiple ERC1155 token types. This function
        is called at the end of a `safeBatchTransferFrom` after the balances have
        been updated. To accept the transfer(s), this must return
        `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))`
        (i.e. 0xbc197c81, or its own function selector).
        @param operator The address which initiated the batch transfer (i.e. msg.sender)
        @param from The address which previously owned the token
        @param ids An array containing ids of each token being transferred (order and length must match values array)
        @param values An array containing amounts of each token being transferred (order and length must match ids array)
        @param data Additional data with no specified format
        @return `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))` if transfer is allowed
    */
    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external
        returns(bytes4);
}

/**
 * @title Standard ERC1155 token
 *
 * @dev Implementation of the basic standard multi-token.
 * See https://eips.ethereum.org/EIPS/eip-1155
 * Originally based on code by Enjin: https://github.com/enjin/erc-1155
 */
contract ERC1155 is ERC165, IERC1155
{
    using SafeMath for uint256;
    using Address for address;

    // Mapping from token ID to owner balances
    mapping (uint256 => mapping(address => uint256)) private _balances;

    // Mapping from owner to operator approvals
    mapping (address => mapping(address => bool)) private _operatorApprovals;

    constructor()
        public
    {
        _registerInterface(
            ERC1155(0).safeTransferFrom.selector ^
            ERC1155(0).safeBatchTransferFrom.selector ^
            ERC1155(0).balanceOf.selector ^
            ERC1155(0).balanceOfBatch.selector ^
            ERC1155(0).setApprovalForAll.selector ^
            ERC1155(0).isApprovedForAll.selector
        );
    }

    /**
        @dev Get the specified address' balance for token with specified ID.
        @param owner The address of the token holder
        @param id ID of the token
        @return The owner's balance of the token type requested
     */
    function balanceOf(address owner, uint256 id) public view returns (uint256) {
        require(owner != address(0), "ERC1155: balance query for the zero address");
        return _balances[id][owner];
    }

    /**
        @dev Get the balance of multiple account/token pairs
        @param owners The addresses of the token holders
        @param ids IDs of the tokens
        @return Balances for each owner and token id pair
     */
    function balanceOfBatch(
        address[] memory owners,
        uint256[] memory ids
    )
        public
        view
        returns (uint256[] memory)
    {
        require(owners.length == ids.length, "ERC1155: owners and IDs must have same lengths");

        uint256[] memory batchBalances = new uint256[](owners.length);

        for (uint256 i = 0; i < owners.length; ++i) {
            require(owners[i] != address(0), "ERC1155: some address in batch balance query is zero");
            batchBalances[i] = _balances[ids[i]][owners[i]];
        }

        return batchBalances;
    }

    /**
     * @dev Sets or unsets the approval of a given operator
     * An operator is allowed to transfer all tokens of the sender on their behalf
     * @param operator address to set the approval
     * @param approved representing the status of the approval to be set
     */
    function setApprovalForAll(address operator, bool approved) external {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    /**
        @notice Queries the approval status of an operator for a given owner.
        @param owner     The owner of the Tokens
        @param operator  Address of authorized operator
        @return           True if the operator is approved, false if not
    */
    function isApprovedForAll(address owner, address operator) external view returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /**
        @dev Transfers `value` amount of an `id` from the `from` address to the `to` address specified.
        Caller must be approved to manage the tokens being transferred out of the `from` account.
        If `to` is a smart contract, will call `onERC1155Received` on `to` and act appropriately.
        @param from Source address
        @param to Target address
        @param id ID of the token type
        @param value Transfer amount
        @param data Data forwarded to `onERC1155Received` if `to` is a contract receiver
    */
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external
    {
        require(to != address(0), "ERC1155: target address must be non-zero");
        require(
            from == msg.sender || _operatorApprovals[from][msg.sender] == true,
            "ERC1155: need operator approval for 3rd party transfers."
        );

        _balances[id][from] = _balances[id][from].sub(value);
        _balances[id][to] = value.add(_balances[id][to]);

        emit TransferSingle(msg.sender, from, to, id, value);

        _doSafeTransferAcceptanceCheck(msg.sender, from, to, id, value, data);
    }

    /**
        @dev Transfers `values` amount(s) of `ids` from the `from` address to the
        `to` address specified. Caller must be approved to manage the tokens being
        transferred out of the `from` account. If `to` is a smart contract, will
        call `onERC1155BatchReceived` on `to` and act appropriately.
        @param from Source address
        @param to Target address
        @param ids IDs of each token type
        @param values Transfer amounts per token type
        @param data Data forwarded to `onERC1155Received` if `to` is a contract receiver
    */
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external
    {
        require(ids.length == values.length, "ERC1155: IDs and values must have same lengths");
        require(to != address(0), "ERC1155: target address must be non-zero");
        require(
            from == msg.sender || _operatorApprovals[from][msg.sender] == true,
            "ERC1155: need operator approval for 3rd party transfers."
        );

        for (uint256 i = 0; i < ids.length; ++i) {
            uint256 id = ids[i];
            uint256 value = values[i];

            _balances[id][from] = _balances[id][from].sub(value);
            _balances[id][to] = value.add(_balances[id][to]);
        }

        emit TransferBatch(msg.sender, from, to, ids, values);

        _doSafeBatchTransferAcceptanceCheck(msg.sender, from, to, ids, values, data);
    }

    /**
     * @dev Internal function to mint an amount of a token with the given ID
     * @param to The address that will own the minted token
     * @param id ID of the token to be minted
     * @param value Amount of the token to be minted
     * @param data Data forwarded to `onERC1155Received` if `to` is a contract receiver
     */
    function _mint(address to, uint256 id, uint256 value, bytes memory data) internal {
        require(to != address(0), "ERC1155: mint to the zero address");

        _balances[id][to] = value.add(_balances[id][to]);
        emit TransferSingle(msg.sender, address(0), to, id, value);

        _doSafeTransferAcceptanceCheck(msg.sender, address(0), to, id, value, data);
    }

    /**
     * @dev Internal function to batch mint amounts of tokens with the given IDs
     * @param to The address that will own the minted token
     * @param ids IDs of the tokens to be minted
     * @param values Amounts of the tokens to be minted
     * @param data Data forwarded to `onERC1155Received` if `to` is a contract receiver
     */
    function _batchMint(address to, uint256[] memory ids, uint256[] memory values, bytes memory data) internal {
        require(to != address(0), "ERC1155: batch mint to the zero address");
        require(ids.length == values.length, "ERC1155: IDs and values must have same lengths");

        for(uint i = 0; i < ids.length; i++) {
            _balances[ids[i]][to] = values[i].add(_balances[ids[i]][to]);
        }

        emit TransferBatch(msg.sender, address(0), to, ids, values);

        _doSafeBatchTransferAcceptanceCheck(msg.sender, address(0), to, ids, values, data);
    }

    /**
     * @dev Internal function to burn an amount of a token with the given ID
     * @param owner Account which owns the token to be burnt
     * @param id ID of the token to be burnt
     * @param value Amount of the token to be burnt
     */
    function _burn(address owner, uint256 id, uint256 value) internal {
        _balances[id][owner] = _balances[id][owner].sub(value);
        emit TransferSingle(msg.sender, owner, address(0), id, value);
    }

    /**
     * @dev Internal function to batch burn an amounts of tokens with the given IDs
     * @param owner Account which owns the token to be burnt
     * @param ids IDs of the tokens to be burnt
     * @param values Amounts of the tokens to be burnt
     */
    function _batchBurn(address owner, uint256[] memory ids, uint256[] memory values) internal {
        require(ids.length == values.length, "ERC1155: IDs and values must have same lengths");

        for(uint i = 0; i < ids.length; i++) {
            _balances[ids[i]][owner] = _balances[ids[i]][owner].sub(values[i]);
        }

        emit TransferBatch(msg.sender, owner, address(0), ids, values);
    }

    function _doSafeTransferAcceptanceCheck(
        address operator,
        address from,
        address to,
        uint256 id,
        uint256 value,
        bytes memory data
    )
        internal
    {
        if(to.isContract()) {
            require(
                IERC1155TokenReceiver(to).onERC1155Received(operator, from, id, value, data) ==
                    IERC1155TokenReceiver(to).onERC1155Received.selector,
                "ERC1155: got unknown value from onERC1155Received"
            );
        }
    }

    function _doSafeBatchTransferAcceptanceCheck(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    )
        internal
    {
        if(to.isContract()) {
            require(
                IERC1155TokenReceiver(to).onERC1155BatchReceived(operator, from, ids, values, data) == IERC1155TokenReceiver(to).onERC1155BatchReceived.selector,
                "ERC1155: got unknown value from onERC1155BatchReceived"
            );
        }
    }
}
