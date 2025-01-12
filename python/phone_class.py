
class Phone:

    wireless = True

    def __init__(self, brand_name, cost): # instance level
        self.cost = cost
        self.brand_name = brand_name

    def setbrandname(self, brand_name):
        self.brand_name = brand_name

    def setprice(self, cost):
        self.cost = cost

if __name__ == "__main__":

    # Create an instance of the phone for motorola
    moto = Phone('Motorola', 10000)
    # moto.setbrandname('Motorola')
    # moto.setprice(10000)
    print(moto.brand_name, moto.cost)

    moto.setprice(20000)
    print(moto.brand_name, moto.cost)

    # create an instance of the phone for iphone
    # iphone = Phone()
    # print(iphone.brand_name, iphone.cost)

    print(Phone.wireless)

