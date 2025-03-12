<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .container {
            display: flex;
            width: 70%;
            margin: 50px auto;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .left-section {
            width: 35%;
            background-color: #4a7c59;
            color: white;
            padding: 30px;
            text-align: center;
        }

        .left-section img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-top: 20px;
            border: 5px solid white;
        }

        .left-section h1 {
            font-size: 26px;
            margin: 20px 0 10px;
        }

        .left-section h2 {
            font-size: 18px;
            margin-top: 20px;
            text-transform: uppercase;
            border-bottom: 2px solid white;
            padding-bottom: 5px;
        }

        .left-section p,
        .left-section ul {
            font-size: 14px;
            line-height: 1.6;
            list-style: none;
            padding: 0;
        }

        .right-section {
            width: 65%;
            padding: 40px;
        }

        h2 {
            color: #4a7c59;
            font-size: 22px;
            margin-bottom: 10px;
            border-bottom: 2px solid #4a7c59;
            padding-bottom: 5px;
        }

        p,
        li {
            font-size: 16px;
            line-height: 1.8;
        }

        ul {
            padding-left: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="left-section">
            {{-- <img src="profile.jpg" alt="Profile Picture"> --}}
            <img src="{{ asset('storage/' . json_decode($beneficiary->image)->original) }}" alt="Profile Picture">

            <h1>{{ $beneficiary->full_name }}</h1>
            <p>Bangla Name: {{ $beneficiary->name_bangla }}</p>
            <p>Phone: {{ $beneficiary->mobile_no }}</p>
            <p>Email: {{ $beneficiary->email }}</p>
            <p>Emergencey Contact: {{ $beneficiary->emergencey_contact }}</p>
            <h2>Memberships</h2>
            <ul style="list-style: none; padding-left: 0;">
                <li>Date of Birth: {{ $beneficiary->date_of_birth }}</li>
                <li>Birth Certificate No: {{ $beneficiary->birth_certificate_no }}</li>
                <li>National ID Card: {{ $beneficiary->nid }}</li>
                <li>Gender: {{ ucfirst($beneficiary->gender) }}</li>
                <li>Marital Status: {{ ucfirst($beneficiary->marital_status) }}</li>
                <li>
                    Present Address:
                    <ul style="list-style: none; padding-left: 0;">
                        <li>{{ ucfirst($beneficiary->present_address) }}</li>
                        <li>State: {{ ucfirst($beneficiary->presentState->name) }}</li>
                        <li>District: {{ ucfirst($beneficiary->presentDistrict->name) }}</li>
                        <li>Upazilla: {{ ucfirst($beneficiary->presentUpazilla->name) }}</li>
                        <li>Thana: {{ ucfirst($beneficiary->presentThana->name) }}</li>
                        <li>Thana Contact: {{ ucfirst($beneficiary->presentThana->contact_no) }}</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="right-section">
            <h2>Documents</h2>
            <ul>
                <li>Birth Certificate:
                    <a href="{{ asset($beneficiary->birth_certificate) }}" target="_blank">View PDF</a>
                    <embed src="{{ asset($beneficiary->birth_certificate) }}" type="application/pdf" width="100%"
                        height="300px">
                </li>
                <li>National ID Card:
                    <a href="{{ asset($beneficiary->nid_card) }}" target="_blank">View PDF</a>
                    <embed src="{{ asset($beneficiary->nid_card) }}" type="application/pdf" width="100%" height="300px">
                </li>
            </ul>

            {{-- <h2>Education</h2> --}}

        </div>
    </div>
</body>

</html>
