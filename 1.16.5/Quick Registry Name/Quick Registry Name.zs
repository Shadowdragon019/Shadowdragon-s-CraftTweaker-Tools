#priority 1

import crafttweaker.api.item.IItemStack;

public function quickRN (input as IItemStack) as string {
	return input.registryName.namespace + "_" + input.registryName.path;
}

// Example
// Un-comment to see
// print(quickRN(<item:minecraft:dirt>));