////////////////////////////////////////
//               MADE BY:             //
//   Shadowdragon019/Wolfboycoolkid   //
////////////////////////////////////////

#priority 1

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import stdlib.List;

	// Size of the recipe, the input, the output, if you can uncraft the item, the item chosen from the input tag, the item chosen from the output tag
public function boxCrafting (size as int, input as IIngredient, output as IIngredient, reverseRecipe as bool = true, tagItemInput as int = 0, tagItemOutput as int = 0) as void {
			
		// Check if indexs are too big and corrects them //
	val maxInputLength = input.items.length as int - 1;
	val maxOutputLength = output.items.length as int - 1;
	if maxInputLength < tagItemInput {
		tagItemInput = maxInputLength;
	}
	if maxOutputLength < tagItemOutput {
		tagItemOutput = maxOutputLength;
	}
	
		// Shorten getting the IItemStack //
	val inputIItemStack = input.items[tagItemInput];
	val outputIItemStack = output.items[tagItemOutput];
		
		// Input -> Output //
	craftingTable.addShaped("crafting/" + quickRN(outputIItemStack) + "_from_" + quickRN(inputIItemStack), outputIItemStack, 
		new IIngredient[][](size, new IIngredient[](size, input))
	);
	// NOTE: IItemStack[][] cannot convert to IIngredient[][]
	
		// Output -> Input //
	if reverseRecipe == true {
		craftingTable.addShapeless("crafting/" + quickRN(inputIItemStack) + "_from_" + quickRN(outputIItemStack), inputIItemStack * (size * size), [
			output
		]);
	}
}

/* 
Examples
Uncomment to see
// Bucket 9x -> Gold Axe (Reversable)
boxCrafting(3, <item:minecraft:milk_bucket>, <item:minecraft:golden_axe>);

// Paper 9x -> Cake (NOT Reversable)
boxCrafting(3, <item:minecraft:paper>, <item:minecraft:cake>, false);

// Any Gold 4x -> Lapis, Lapis -> Nether Gold
boxCrafting(2, <tag:items:forge:ores/gold>, <tag:items:forge:ores/lapis>, true, 1);

// 4x Iron -> Coal (NOT Reversable)
boxCrafting(2, <tag:items:forge:ores/iron>, <tag:items:forge:ores/coal>, false);

// Nether Sword -> Apple (Reversable)
boxCrafting(1, <item:minecraft:netherite_sword>, <item:minecraft:apple>);

// Snowball -> Leather (NOT Reversable)
boxCrafting(1, <item:minecraft:snowball>, <item:minecraft:leather>, false);
*/
