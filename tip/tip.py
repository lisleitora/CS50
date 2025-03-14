def main():
    dollars = dollars_to_float(input("How much was the meal? "))
    percent = percent_to_float(input("What percentage would you like to tip? "))
    tip = dollars * percent
    print(f"Leave ${tip:.2f}")


def dollars_to_float(d):
    # TODO
    d.removeprefix('$')
    return d.float()


def percent_to_float(p):
    # TODO
    p.removesuffix('%')

main()
print(percent_to_float + dollars_to_float)
