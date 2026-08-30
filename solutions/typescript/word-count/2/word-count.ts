export function count(text: string): Map<string, number> {
    const cleanText = text.toLowerCase().replace(/[^\w']+|'(?!\w)|(?<!\w)'/g, " ");
    const words = cleanText.split(/\s+/).filter(word => word !== "");

    return words.reduce((acc, word) => {
        acc.set(word, (acc.get(word) || 0) + 1);
        return acc;
    }, new Map<string, number>());
}

