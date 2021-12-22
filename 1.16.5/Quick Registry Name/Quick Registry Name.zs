#priority 1

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;

public function quickRN (input as IIngredient, tagItem as int = 0) as string {
		// Check if indexs are too big and corrects them //
	val maxLength = input.items.length as int - 1;
	if maxLength < tagItem {
		tagItem = maxLength;
	}
	
	return input.items[tagItem].registryName.namespace + "_" + input.items[tagItem].registryName.path;
}

// Example
// Un-comment to see
// print(quickRN(<item:minecraft:dirt>));