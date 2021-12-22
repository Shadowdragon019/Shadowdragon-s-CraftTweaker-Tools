#priority 1

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import stdlib.List;

public function boxCrafting (size as int, input as IItemStack, output as IItemStack, reverseRecipe as bool = true) as void {
	
		// Input -> Output //
	craftingTable.addShaped("crafting/" + quickRN(output) + "_from_" + quickRN(input), output, 
		new IIngredient[][](size, new IIngredient[](size, input))
	);
	// NOTE: IItemStack[][] cannot convert to IIngredient[][]
	
		// Output -> Input //
	if reverseRecipe = true {
		craftingTable.addShapeless("crafting/" + quickRN(input) + "_from_" + quickRN(output), input * (size * size), [
			output
		]);
	}
}

/* Examples
boxCrafting(1, <item:minecraft:milk_bucket>, <item:woodenbuckets:wooden_milk_bucket>);
boxCrafting(2, <item:minecraft:nether_gold_ore>, <item:minecraft:gold_ore>);
boxCrafting(3, <item:minecraft:iron_ore>, <item:minecraft:coal_ore>);
*/
