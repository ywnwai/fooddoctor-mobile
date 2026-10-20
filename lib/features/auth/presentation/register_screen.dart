import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/app_select_field.dart';
import 'package:food_doctor/core/widgets/app_text_field.dart';
import 'package:food_doctor/core/widgets/auth_hero.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/features/auth/domain/registration.dart';
import 'package:food_doctor/features/auth/presentation/capture_prompt.dart';
import 'package:food_doctor/features/knowledge/data/knowledge_catalog.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _telephone = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _businessName = TextEditingController();
  final _position = TextEditingController();
  final _password = TextEditingController();
  final _confirmed = TextEditingController();
  final _capture = TextEditingController();

  static const _businessTypes = [
    'Manufacturer',
    'Distributor',
    'Retail',
    'Consultancy',
  ];

  String? _businessType;
  String? _product;
  String? _size;
  var _error = '';

  @override
  void dispose() {
    _name.dispose();
    _telephone.dispose();
    _email.dispose();
    _address.dispose();
    _businessName.dispose();
    _position.dispose();
    _password.dispose();
    _confirmed.dispose();
    _capture.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return FeaturePage(
      title: 'Create an account',
      subtitle: 'All fields are required',
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          const AuthHero(
            title: 'Join Food Doctor',
            subtitle: 'All fields are required. An administrator must approve the account.',
          ),
          const SizedBox(height: AppSpacing.lg),
          ContentCard(
            child: Column(
              children: [
          _field('Name', _name),
          _field('Telephone', _telephone, keyboardType: TextInputType.phone),
          _field('Email', _email, keyboardType: TextInputType.emailAddress),
          _field('Address', _address, maxLines: 2),
          _field('Name of business', _businessName),
          _field('Current position', _position),
          AppSelectField<String>(
            label: 'Type of business',
            value: _businessType,
            options: _businessTypes,
            labelOf: (value) => value,
            onChanged: (value) => setState(() => _businessType = value),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppSelectField<String>(
            label: 'Manufactured product',
            value: _product,
            options: [
              for (final category in KnowledgeCatalog.categories) category.name,
            ],
            labelOf: (value) => value,
            onChanged: (value) => setState(() => _product = value),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppSelectField<String>(
            label: 'Size of business',
            value: _size,
            options: [for (final size in KnowledgeCatalog.sizes) size.label],
            labelOf: (value) => value,
            onChanged: (value) => setState(() => _size = value),
          ),
          const SizedBox(height: AppSpacing.sm),
          _field('Password', _password, obscureText: true),
          _field('Confirmed password', _confirmed, obscureText: true),
          const CapturePrompt(),
          const SizedBox(height: AppSpacing.sm),
          _field('Capture', _capture),
          if (_error.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Text(
                _error,
                style: text.caption.copyWith(color: AppColors.danger),
              ),
            ),
          PrimaryButton(label: 'Submit', onPressed: _submit),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppTextField(
        label: label,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
      ),
    );
  }

  void _submit() {
    final error = registrationError(
      RegistrationInput(
        name: _name.text,
        telephone: _telephone.text,
        email: _email.text,
        address: _address.text,
        businessName: _businessName.text,
        position: _position.text,
        businessType: _businessType,
        product: _product,
        size: _size,
        password: _password.text,
        confirmedPassword: _confirmed.text,
        capture: _capture.text,
      ),
    );
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    setState(() => _error = '');
    showAppDialog(
      context: context,
      title: 'Waiting for approval',
      message:
          'An administrator must approve this account before the app can be used. You will be notified by SMS.',
      primaryLabel: 'Back to sign in',
      onPrimary: () => context.go(AppRoutes.login),
    );
  }
}
