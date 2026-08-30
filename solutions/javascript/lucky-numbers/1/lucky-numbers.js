// @ts-check

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
  return Number(array1.join('')) + Number(array2.join(''));
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean} whether the number is a palindrome or not
 */
export function luckyNumber(value) {
  const str = new String(value);
  const len = str.length;
  for (let i = 0; i < len / 2; i++) {
    if (str[i] != str[len - i - 1]) {
      return false;
    }
  }
  return true;
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
  const val = Number(input);
  if (input !== 0 && !Boolean(input)) return 'Required field';
  if (val == 0 || isNaN(val)) return 'Must be a number besides 0';
  return '';
  
}
