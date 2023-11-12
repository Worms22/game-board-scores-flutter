## Contracts - Interfaces

The dedicated application contracts, put here every reusable contract which is not related to a
specific feature e.g: themeable.dart this contract can be applied to every thing which can be
themed.

### Name convince

The name is just a helpful standard which can make easy understanding the context of a class, I mean
how do we know if that class is a contract? of course with out going to the class definition.

Never put "I" prefix before class name e.g: "ITheme" instead use "able" to the end of the name e.g:
"Themeable" which mean that the subclass is able to be themed.

NOTE: The contract must be without any kine of implementation ("abstract"), if you need same
contract with same than add "impl" prefix to the implementation class.

There are some cases in which you need to implement a certain method in the contract to be able to
reuse it, but those cases should be made by an expert developer.