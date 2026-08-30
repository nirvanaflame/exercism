export function clean(no) {
    no = no.replace(/[() -.]|/g, '')
    no = no.length === 10 ? '1' + no : no

    switch (true) {
        case !!no.match(/[@:!]/):
            throw new Error('Punctuations not permitted')
        case !!no.match(/[a-z]/):
            throw new Error('Letters not permitted')
        case no.length < 11:
            throw new Error('Incorrect number of digits')
        case no.length > 11:
            throw new Error('More than 11 digits')
        case no[0] !== '1':
            throw new Error('11 digits must start with 1')
        case no[1] === '0':
            throw new Error('Area code cannot start with zero')
        case no[1] === '1':
            throw new Error('Area code cannot start with one')
        case no[4] === '0':
            throw new Error('Exchange code cannot start with zero')
        case no[4] === '1':
            throw new Error('Exchange code cannot start with one')
    }

    return no.slice(1)
}