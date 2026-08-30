export const reverse = (str: string) => [...str].reduce((acc, next) => next + acc, "")
