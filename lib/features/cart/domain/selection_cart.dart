import 'package:flutter/foundation.dart';

class CartLine {
  const CartLine({
    required this.id,
    required this.title,
    required this.priceKyat,
  });

  final String id;
  final String title;
  final int priceKyat;
}

class InquiryLine {
  const InquiryLine({
    required this.id,
    required this.title,
    required this.note,
  });

  final String id;
  final String title;
  final String note;
}

class SentInquiry {
  const SentInquiry({required this.title, required this.answer});

  final String title;
  final String answer;
}

/// Local purchase and inquiry selections.
///
/// Nothing is sent to a server. Confirming a purchase or inquiry only
/// records it for this session.
class SelectionCart extends ChangeNotifier {
  final List<CartLine> purchases = [];
  final List<InquiryLine> inquiries = [];
  final List<SentInquiry> sentInquiries = [
    const SentInquiry(
      title: 'PET bottle, 330 ml',
      answer: 'A supplier list will be shared after the inquiry is reviewed.',
    ),
  ];
  final Set<String> ownedKnowledgeIds = {'bakery-micro-safety-overview'};

  int get purchaseTotal =>
      purchases.fold(0, (total, line) => total + line.priceKyat);

  void addPurchase(CartLine line) {
    if (purchases.any((item) => item.id == line.id)) {
      return;
    }
    purchases.add(line);
    notifyListeners();
  }

  void clearPurchases() {
    purchases.clear();
    notifyListeners();
  }

  void confirmPurchase() {
    ownedKnowledgeIds.addAll(purchases.map((line) => line.id));
    purchases.clear();
    notifyListeners();
  }

  void addInquiry(InquiryLine line) {
    inquiries.removeWhere((item) => item.id == line.id);
    inquiries.add(line);
    notifyListeners();
  }

  void clearInquiries() {
    inquiries.clear();
    notifyListeners();
  }

  void confirmInquiries() {
    sentInquiries.insertAll(
      0,
      inquiries.map(
        (line) => SentInquiry(
          title: line.title,
          answer: 'Sent to the administrator. ${line.note}',
        ),
      ),
    );
    inquiries.clear();
    notifyListeners();
  }
}
