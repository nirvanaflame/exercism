// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
const mem = {
  'Pure Strawberry Joy': 0.5,
  'Energizer': 1.5,
  'Green Garden': 1.5,
  'Tropical Island': 3,
  'All or Nothing': 5
}

export function timeToMixJuice(name) {
  const v = mem[name];
  return v == null ? 2.5 : v;
}

const cuts = {
  'small': 6,
  'medium': 8,
  'large': 10
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  if (wedgesNeeded == 0) return 0;
  let count = 0;
  while (wedgesNeeded >= 0 && limes[count] != null) {
    wedgesNeeded -= cuts[limes[count]];
    count++;
  }
  return count;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let i = 0;
  while (timeLeft > 0) {
    timeLeft -= timeToMixJuice(orders[i]);
    i++;
  }
  console.log(i);
  return orders.slice(i);
}
