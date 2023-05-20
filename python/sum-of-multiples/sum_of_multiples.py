def sum_of_multiples(limit: int, numbers: []):
    return sum(
        {
            i for num in numbers if num
            for i in range(num, limit, num)
        }
    )
