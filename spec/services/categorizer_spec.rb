RSpec.describe Categorizer do
  let(:transactions) do
    [
      {date: "01/07/23", type: "POS 403875XXXXXX8164 DIGITALOCEAN.COM",                                                       amount: 5422.53},
      {date: "01/07/23", type: "UPI-MILK BAR STUDIO-PAYTMQR10PLACGEVQ@PAYTM-PYTM0123456-318254817024-FOOD",                   amount: 630.0},
      {date: "01/07/23", type: "UPI-KOMAL SINGH-PAYTMQR281005050101HUYVMTPG1OGZ@PAYTM-PYTM0123456-318255555428-PLANTS",       amount: 625.0},
      {date: "01/07/23", type: "UPI-ZEE5-ZEE5@PAYTM-PYTM0123456-354840507983-SUBSCRIPTION FOR Z",                             amount: 699.0},
      {date: "02/07/23", type: "UPI-NETFLIX COM-NETFLIXUPI.PAYU@HDFCBANK-HDFC0000499-318391098086-MONTHLY AUTOPAY. C",        amount: 649.0},
      {date: "04/07/23", type: "FEE-ATM CASH(1TXN)27/06/23-CDT2318417079397",                                                 amount: 24.78},
      {date: "05/07/23", type: "UPI-IRCTC WEB UPI-PAYTM-651536@PAYTM-PYTM0123456-318656850415-UPI",                           amount: 3783.6},
      {date: "05/07/23", type: "50100097841947-TPT-MTM-GULSHANARA NADAPH",                                                    amount: 960000.0},
      {date: "05/07/23", type: "UPI-BUBHANDARI-BUBHANDARIESBZ1@ICICI-ICIC0DC0099-318680271044-BIKE POLICY",                   amount: 10895.0},
      {date: "06/07/23", type: ".DC INTL POS TXN MARKUP+ST 080523 100523-CDT2318417054004",                                   amount: 811.26},
      {date: "07/07/23", type: "UPI-SHAHNAWAZ KHAN-PAYTMQR2810050501011JAVDMKT07UR@PAYTM-PYTM0123456-318834282261-MEDICINES", amount: 485.0},
      {date: "08/07/23", type: "UPI-IRCTCC-RAZORPAY.IRCTC@HDFCBANK-HDFC0000053-318907691078-PAY VIA RAZORPAY",                amount: 1803.6},
      {date: "08/07/23", type: "UPI-IRCTCC-RAZORPAY.IRCTC@HDFCBANK-HDFC0000053-318907689622-PAY VIA RAZORPAY",                amount: 2353.6},
      {date: "09/07/23", type: "UPI-MAKE MY TRIP INDIA P-MAKEMYTRIP@HDFCBANK-HDFC0000499-319010262550-PAYMENT REQUEST FR",    amount: 1200.0},
      {date: "10/07/23", type: "UPI-AMAZON PAY GROCERIES-AMAZONPAYGROCERY@YAPL-YESB0APLUPI-319117084658-YOU ARE PAYING FOR",  amount: 499.0},
      {date: "10/07/23", type: "ME DC SI 403875XXXXXX8164 WWW.DRIFTINGRUBY.COM",                                              amount: 745.16},
      {date: "11/07/23", type: "POS 403875XXXXXX8164 DELHI INTERNATIO",                                                       amount: 2.0},
      {date: "14/07/23", type: "UPI-BHARATPEMERCHANT-BHARATPE.0870058577@ICICI-ICIC0DC0099-319596311461-PAY TO CIMETS INAM",  amount: 1250.0},
      {date: "14/07/23", type: "UPI-UBER INDIA SYSTEMS P-UBERRIDES@HDFCBANK-HDFC0000499-319520999992-CHARGE",                 amount: 252.56},
      {date: "15/07/23", type: "UPI-UBER INDIA SYSTEMS P-UBERRIDES@HDFCBANK-HDFC0000499-319624236494-CHARGE",                 amount: 144.17},
      {date: "16/07/23", type: "UPI-UBER INDIA SYSTEMS P-UBERRIDES@HDFCBANK-HDFC0000499-319724779091-CHARGE",                 amount: 178.21},
      {date: "16/07/23", type: "UPI-BIGTREE ENTERTAINMEN-BOOKMYSHOW@AXB-UTIB0000100-356358818599-DEBIT MONEY USING",          amount: 810.0},
      {date: "16/07/23", type: "UPI-AMIT KAMLAKAR KALVAN-AMIT.KALVANKAR35@OKICICI-UBIN0532193-319778637620-PETROL",           amount: 1127.0},
      {date: "17/07/23", type: "UPI-GANPAT LAL-PAYTMQR1VD7WZ3OMP@PAYTM-PYTM0123456-319883954007-GROCERY",                     amount: 765.0},
      {date: "17/07/23", type: ".DC INTL POS TXN MARKUP+ST 260523 270523-CDT2318417054004",                                   amount: 80.72},
      {date: "18/07/23", type: "UPI-UBER INDIA SYSTEMS P-UBERRIDES@HDFCBANK-HDFC0000499-319931166659-CHARGE",                 amount: 195.4},
      {date: "19/07/23", type: "GST/BANK REFERENCE NO: R2320045568120/CIN NO: HDFC23072700464056",                            amount: 40.0},
      {date: "20/07/23", type: "UPI-CAFE SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-PYTM0123456-320167203655-TEA",                       amount: 30.0}
    ]
  end

  describe '#call' do
    subject { described_class.new(description).call }

    context '#entertainment' do
      context 'when description has netflix' do
        let(:description) { 'UPI-NETFLIX COM-NETFLIXUPI.PAYU@HDFCBANK-HDFC0000499-318391098086-MONTHLY AUTOPAY. C' }

        specify do
          expect(subject).to eq('ENTERTAINMENT')
        end
      end

      context 'when description has zee5' do
        let(:description) { 'UPI-ZEE5-ZEE5@PAYTM-PYTM0123456-354840507983-SUBSCRIPTION FOR Z' }

        specify do
          expect(subject).to eq('ENTERTAINMENT')
        end
      end

      context 'when description has amazon prime' do
        let(:description) { 'UPI-AMAZON PAY-AMAZONUPI@APL-UTIB0000100-301583171547-AMAZON PRIME RECUR' }

        specify do
          expect(subject).to eq('ENTERTAINMENT')
        end
      end

      context 'when description has bookmyshow' do
        let(:description) { 'UPI-BIGTREE ENTERTAINMEN-BOOKMYSHOW@AXB-UTIB0000100-356358818599-DEBIT MONEY USING' }

        specify do
          expect(subject).to eq('ENTERTAINMENT')
        end
      end
    end

    context '#travel' do
      context 'when description has irctc' do
        let(:description) { 'UPI-IRCTC WEB UPI-PAYTM-651536@PAYTM-PYTM0123456-318656850415-UPI' }

        specify do
          expect(subject).to eq('TRAVEL')
        end
      end

      context 'when description has make my trip' do
        let(:description) { 'UPI-MAKE MY TRIP INDIA P-MAKEMYTRIP@HDFCBANK-HDFC0000499-319010262550-PAYMENT REQUEST FR' }

        specify do
          expect(subject).to eq('TRAVEL')
        end
      end

      context 'when description has uber' do
        let(:description) { 'UPI-UBER INDIA SYSTEMS P-UBERRIDES@HDFCBANK-HDFC0000499-319520999992-CHARGE' }

        specify do
          expect(subject).to eq('TRAVEL')
        end
      end

      context 'when description has ola' do
        let(:description) { 'UPI-OLA CABS-OLACABS@HDFCBANK-HDFC0000499-319520999992-CHARGE' }

        specify do
          expect(subject).to eq('TRAVEL')
        end
      end
    end

    context '#groceries' do
      context 'when description has grocery' do
        let(:description) { 'UPI-GANPAT LAL-PAYTMQR1VD7WZ3OMP@PAYTM-PYTM0123456-319883954007-GROCERY' }

        specify do
          expect(subject).to eq('GROCERIES')
        end
      end

      context 'when description has groceries' do
        let(:description) { 'UPI-GANPAT LAL-PAYTMQR1VD7WZ3OMP@PAYTM-PYTM0123456-319883954007-GROCERIES' }

        specify do
          expect(subject).to eq('GROCERIES')
        end
      end
    end

    context '#petrol' do
      context 'when description has petrol' do
        let(:description) { 'UPI-AMIT KAMLAKAR KALVAN-AMIT.KALVANKAR35@OKICICI-UBIN0532193-319778637620-PETROL' }

        specify do
          expect(subject).to eq('PETROL')
        end
      end

      context 'when description has petrol' do
        let(:description) { 'UPI-INDIAN OIL PETROL PU-Q80381860@YBL-YESB0YBLUPI-300654975966-UPI' }

        specify do
          expect(subject).to eq('PETROL')
        end
      end

      context 'when description has oil' do
        let(:description) { 'UPI-INDIANOIL CORPORATI-INDIANOILCORPORATION.76020356@HDFCBANK-HDFC0000001-228434651460-COLLECT' }

        specify do
          expect(subject).to eq('PETROL')
        end
      end

      context 'when description has petroleum' do
        let(:description) { 'UPI-DHARMAVAT PETROLEUM-PAYTMQR148067@PAYTM-PYTM0123456-232665444283-PETROL' }

        specify do
          expect(subject).to eq('PETROL')
        end
      end

      context 'when description has petroleum' do
        let(:description) { 'UPI-D J PETROLEUM-PAYTMQR2810050501011USMLO3V49GU@PAYTM-PYTM0123456-210173370846-UPI' }

        specify do
          expect(subject).to eq('PETROL')
        end
      end
    end

    context '#education' do
      context 'when description has gorails' do
        let(:description) { 'ME DC SI 403875XXXXXX8164 GO RAILS' }

        specify do
          expect(subject).to eq('EDUCATION')
        end
      end

      context 'when description has driftingruby' do
        let(:description) { 'ME DC SI 403875XXXXXX8164 WWW.DRIFTINGRUBY.COM' }

        specify do
          expect(subject).to eq('EDUCATION')
        end
      end
    end

    context '#food' do
      context 'when description has fruits' do
        let(:description) { 'UPI-SARTHAK VISHRAM NISH-PAYTMQR2810050501011DCM41CKDWE9@PAYTM-PYTM0123456-228113457844-FRUITS' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description has chicken' do
        let(:description) { 'UPI-CHICKEN COUNTRY-PAYTMQR2810050501011Z0O0YQZQX2ZU@PAYTM-PYTM0123456-228113457844-CHICKEN' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description has milk' do
        let(:description) { 'UPI-MR PRADEEP KISAN DHA-DHAWALEPRADEEP7@OKHDFCBANK-MAHB0000859-302731763944-MILK DECEMBER' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description is for swiggy' do
        let(:description) { 'UPI-SWIGGY-UPISWIGGY@ICICI-ICIC0DC0099-212814771790-PAYMENT FOR SWIGGY' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description is for zomato' do
        let(:description) { 'UPI-RAZORPAYZOMATO-ZOMATOINDIA@ICICI-ICIC0DC0099-228377421092-ZOMATOONLINEORDER' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description has tea' do
        let(:description) { 'UPI-CAFE SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-PYTM0123456-320167203655-TEA' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description has cafe' do
        let(:description) { 'UPI-CAFE SAHEEHA-PAYTMQRDCNFRAGNT4@PAYTM-PYTM0123456-320167203655-CAFE' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end

      context 'when description has milk bar studio' do
        let(:description) { 'UPI-MILK BAR STUDIO-PAYTMQR10PLACGEVQ@PAYTM-PYTM0123456-318254817024-FOOD' }

        specify do
          expect(subject).to eq('FOOD')
        end
      end
    end

    context '#bike' do
      context 'when description is for bike' do
        let(:description) { 'UPI-BUBHANDARI-BUBHANDARIESBZ1@ICICI-ICIC0DC0099-318680271044-BIKE POLICY' }

        specify do
          expect(subject).to eq('BIKE')
        end
      end

      context 'when description is for bike' do
        let(:description) { 'UPI-B U BHANDARI AUTO PV-20220312140118@YESBANK-YESB0000728-234663072691-BIKE SERVICE' }

        specify do
          expect(subject).to eq('BIKE')
        end
      end
    end

    context '#project' do
      context 'when description is for digital ocean' do
        let(:description) { 'POS 403875XXXXXX8164 DIGITALOCEAN.COM' }

        specify do
          expect(subject).to eq('PROJECT')
        end
      end

      context 'when description is for salary' do
        let(:description) { 'UPI-SANTOSH SADASHIV KUM-SANTOSHSKUMBHAR08@OKAXIS-IBKL0000087-209562274667-MARCH SALARY' }

        specify do
          expect(subject).to eq('PROJECT')
        end
      end
    end

    context '#medicine' do
      context 'when description is for medicine' do
        let(:description) { 'UPI-SHAHNAWAZ KHAN-PAYTMQR2810050501011JAVDMKT07UR@PAYTM-PYTM0123456-318834282261-MEDICINES' }

        specify do
          expect(subject).to eq('MEDICINES')
        end
      end

      context 'when description is for medicine' do
        let(:description) { 'UPI-NEW GOPALJEE HEALTHC-PAYTMQR2810050501011NY8R0VH23GX@PAYTM-PYTM0123456-233070758671-MEDS' }

        specify do
          expect(subject).to eq('MEDICINES')
        end
      end

      context 'when description is for medicine' do
        let(:description) { 'UPI-HEALTH  FIRST MEDICA-Q977664708@YBL-INDB0000173-230179896439-UPI' }

        specify do
          expect(subject).to eq('MEDICINES')
        end
      end
    end

    context '#shopping' do
      context 'when description is for shopping' do
        let(:description) { 'UPI-KASHMIRI ARTS-GPAY-11207719133@OKBIZAXIS-UTIB0000000-307242571179-CLOTHES' }

        specify do
          expect(subject).to eq('SHOPPING')
        end
      end

      context 'when description is for shopping' do
        let(:description) { 'UPI-GO COLORS 1518-PAYTMQR281005050101XZVEOJ4B0I32@PAYTM-PYTM0123456-235058277648-SHOPPING' }

        specify do
          expect(subject).to eq('SHOPPING')
        end
      end

      context 'when description is for shopping' do
        let(:description) { 'UPI-PINELABSPOS-PINELABSPOS.355974@ICICI-ICIC0DC0099-226703952307-ZARA' }

        specify do
          expect(subject).to eq('SHOPPING')
        end
      end
    end
  end
end
