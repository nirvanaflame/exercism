/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */


export const cookingStatus = (remainingTime) => {
  switch(remainingTime) {
    case 0: return 'Lasagna is done.';
    case undefined: return 'You forgot to set the timer.';
    default: return 'Not done, please wait.';
  }
}

export const preparationTime = (layers = [], timePerLayer = 2) => {
  return layers.length * timePerLayer;
}

export const quantities = (ingredients = []) => {
  const res = {
    noodles: 0,
    sauce: 0
  }
  
  for (const x of ingredients) {
    if (x === 'noodles') {
      res[x] += 50;
    } else if (x === 'sauce') {
      res[x] += 0.2;
    }
  }

  return res;
} 

export function addSecretIngredient(friendsList, myList) {
  myList.push(friendsList[friendsList.length-1]);
}


export const scaleRecipe = (recipe, portions = 2) => {
  if (portions == 2) return recipe;

  const res = {};
  for (const [key, value] of Object.entries(recipe)) {
    res[key] = value * portions / 2
  }

  return res;
} 