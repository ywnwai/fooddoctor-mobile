import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_text_field.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/features/profile/presentation/profile_scope.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController? _name;
  TextEditingController? _telephone;
  TextEditingController? _email;
  TextEditingController? _address;
  TextEditingController? _business;
  TextEditingController? _position;
  TextEditingController? _type;
  TextEditingController? _product;
  TextEditingController? _size;
  var _message = '';
  var _saved = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_name != null) {
      return;
    }
    final account = ProfileScope.of(context);
    _name = TextEditingController(text: account.name);
    _telephone = TextEditingController(text: account.telephone);
    _email = TextEditingController(text: account.email);
    _address = TextEditingController(text: account.address);
    _business = TextEditingController(text: account.business);
    _position = TextEditingController(text: account.position);
    _type = TextEditingController(text: account.type);
    _product = TextEditingController(text: account.product);
    _size = TextEditingController(text: account.size);
  }

  @override
  void dispose() {
    _name?.dispose();
    _telephone?.dispose();
    _email?.dispose();
    _address?.dispose();
    _business?.dispose();
    _position?.dispose();
    _type?.dispose();
    _product?.dispose();
    _size?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final name = _name;
    if (name == null) {
      return FeaturePage(
        title: l10n.accountInformation,
        showBackButton: true,
        child: const SizedBox.shrink(),
      );
    }

    return FeaturePage(
      title: l10n.accountInformation,
      subtitle: l10n.profileSubtitle,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          _field(l10n.name, name),
          _field(l10n.telephone, _telephone!),
          _field(l10n.email, _email!),
          _field(l10n.address, _address!, maxLines: 2),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(height: 1, color: AppColors.border),
          ),
          _field(l10n.nameOfBusiness, _business!),
          _field(l10n.currentPosition, _position!),
          _field(l10n.typeOfBusiness, _type!),
          _field(l10n.manufacturedProduct, _product!),
          _field(l10n.sizeOfBusiness, _size!),
          if (_message.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              _message,
              style: context.appText.caption.copyWith(
                color: _saved ? AppColors.green : AppColors.danger,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(label: l10n.saveAccount, onPressed: _save),
        ],
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppTextField(
        label: label,
        controller: controller,
        maxLines: maxLines,
      ),
    );
  }

  void _save() {
    final missing = [
      _name!,
      _telephone!,
      _email!,
      _address!,
      _business!,
      _position!,
      _type!,
      _product!,
      _size!,
    ].any((field) => field.text.trim().isEmpty);
    if (missing) {
      setState(() {
        _saved = false;
        _message = 'Fill in every account field.';
      });
      return;
    }
    ProfileScope.of(context).update(
      name: _name!.text.trim(),
      telephone: _telephone!.text.trim(),
      email: _email!.text.trim(),
      address: _address!.text.trim(),
      business: _business!.text.trim(),
      position: _position!.text.trim(),
      type: _type!.text.trim(),
      product: _product!.text.trim(),
      size: _size!.text.trim(),
    );
    setState(() {
      _saved = true;
      _message = 'Account saved on this device.';
    });
  }
}
