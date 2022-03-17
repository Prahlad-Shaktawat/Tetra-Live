import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int wishTicketCounter = 0;
  int ticketCounter = 1;
  int coffeeCounter = 2;
  int sandWitchCounter = 1;
  int totalPaymentCounter = 300;

  wishTicketDecrement() {
    if (this.wishTicketCounter > 0) {
      this.wishTicketCounter--;
    }
    notifyListeners();
  }

  wishTicketIncrement() {
    if (this.wishTicketCounter < 100) {
      this.wishTicketCounter++;
    }
    notifyListeners();
  }

  ticketDecrement() {
    if (this.ticketCounter > 0) {
      this.ticketCounter--;
    }
    notifyListeners();
  }

  ticketIncrement() {
    if (this.ticketCounter < 100) {
      this.ticketCounter++;
    }
    notifyListeners();
  }

  coffeeDecrement() {
    if (coffeeCounter > 0) {
      coffeeCounter--;
    }
    notifyListeners();
  }

  coffeeIncrement() {
    if (coffeeCounter < 100) {
      coffeeCounter++;
    }
    notifyListeners();
  }

  sandWitchDecrement() {
    if (sandWitchCounter > 0) {
      sandWitchCounter--;
    }
    notifyListeners();
  }

  sandWitchIncrement() {
    if (sandWitchCounter < 100) {
      sandWitchCounter++;
    }
    notifyListeners();
  }

  totalPaymentDecrement() {
    if (totalPaymentCounter > 0) {
      totalPaymentCounter -= 300;
    }
    notifyListeners();
  }

  totalPaymentIncrement() {
    if (totalPaymentCounter < 1200) {
      totalPaymentCounter += 300;
    }
    notifyListeners();
  }
}
