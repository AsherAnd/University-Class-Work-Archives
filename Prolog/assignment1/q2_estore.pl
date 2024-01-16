% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Khushi Chowdhury
%%%%% NAME: Asher Andargachew 
%%%%% NAME: Wathaned Ean
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: cost
% Put your atomic statements for the cost in this section

cost(laptop, 1000).
cost(monitor, 300).
cost(keyboard, 50).

%%%%% SECTION: numPurchased
% Put your atomic statements for the numPurchased predicate in this section

numPurchased(laptop, 1).
numPurchased(monitor, 3).
numPurchased(keyboard, 2).


%%%%% SECTION: shippingCost
% Put your atomic statements for the shippingCost predicate in this section

shippingCost(laptop, 30).
shippingCost(monitor, 20).
shippingCost(keyboard, 10).

%%%% SECTION: taxRate
% Put your atomic statements for the taxRate predicate in this section

taxRate(0.13).

%%%%% SECTION: freeRegularShippingMin
% Put your atomic statements for the freeRegularShippingMin predicate in this section

freeRegularShippingMin(500).

%%%%% SECTION: freeExpressShippingMin
% Put your atomic statements for the freeExpressShippingMin predicate in this section

freeExpressShippingMin(750).

%%%%% SECTION: subtotal
% Put your rules for the subtotal predicate in this section

subtotal(Sub) :-
    cost(laptop, LaptopCost),
    cost(monitor, MonitorCost),
    cost(keyboard, KeyboardCost),
    numPurchased(laptop, LaptopNum),
    numPurchased(monitor, MonitorNum),
    numPurchased(keyboard, KeyboardNum),
    Sub is (LaptopCost * LaptopNum) + (MonitorCost * MonitorNum) + (KeyboardCost * KeyboardNum).


%%%%% SECTION: calculateBaseShipping
% Put your rules for the calculateBaseShipping predicate in this section

calculateBaseShipping(ShippingCost) :-
    shippingCost(laptop, LaptopShipCost),
    shippingCost(monitor, MonitorShipCost),
    shippingCost(keyboard, KeyboardShipCost),
    numPurchased(laptop, LaptopNum),
    numPurchased(monitor, MonitorNum),
    numPurchased(keyboard, KeyboardNum),
    ShippingCost is (LaptopShipCost * LaptopNum) + (MonitorShipCost * MonitorNum) + (KeyboardShipCost * KeyboardNum).

%%%%% SECTION: calculateShipping
% Put your rules for the calculateShipping predicate in this section

calculateShipping(regular, ShippingCost) :-
    calculateBaseShipping(ShippingCost).

calculateShipping(express, ShippingCost) :-
    calculateBaseShipping(BaseShippingCost),
    ShippingCost is BaseShippingCost * 1.5.

%%%%% SECTION: totalCost
% Put your rules for the totalCost predicate in this section

totalCost(ShippingType, Cost) :-
    subtotal(Subtotal),
    taxRate(TaxRate),
    calculateShipping(ShippingType, ShippingCost),
    Cost is Subtotal + ShippingCost + (Subtotal + ShippingCost) * TaxRate.