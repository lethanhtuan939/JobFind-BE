<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .email-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .email-header {
            background-color: #007BFF;
            color: #ffffff;
            text-align: center;
            padding: 20px;
        }
        .email-header h1 {
            margin: 0;
            font-size: 24px;
        }
        .email-body {
            padding: 30px;
            color: #333333;
            line-height: 1.6;
        }
        .email-body p {
            margin: 0 0 20px;
        }
        .otp-code {
            display: block;
            margin: 20px 0;
            padding: 10px;
            background-color: #f3f4f6;
            color: #007BFF;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            border: 2px dashed #007BFF;
            border-radius: 8px;
        }
        .email-footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #666666;
            background-color: #f3f4f6;
        }
        .email-footer a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <!-- Header -->
        <div class="email-header">
            <h1>Email Verification</h1>
        </div>

        <!-- Body -->
        <div class="email-body">
            <p>Dear User,</p>
            <p>Thank you for signing up! Please use the OTP below to verify your email address:</p>

            <!-- OTP Code -->
            <div class="otp-code">{{ $otpCode }}</div>

            <p>This OTP is valid for <strong>5 minutes</strong>. Please do not share it with anyone for your security.</p>
            <p>If you did not request this email, please ignore it.</p>
        </div>

        <!-- Footer -->
        <div class="email-footer">
            <p>Need help? <a href="mailto:support@yourdomain.com">Contact Support</a></p>
            <p>&copy; {{ date('Y') }} JobFind. All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>
