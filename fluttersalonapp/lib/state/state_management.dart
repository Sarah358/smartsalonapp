import 'package:flutter_riverpod/flutter_riverpod.dart';



// booking state
final currentStep =StateProvider((ref)=>1);
final selectedService = StateProvider((ref)=>'hair');
final selectedServicebranch = StateProvider((ref)=>'');

