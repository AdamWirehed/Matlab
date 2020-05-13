 primes = [];
 for x=2:1000
     is_prime=1
        for p=primes
            if mod(x,p)==0
                is_prime=0
                break
            end
        end
     if is_prime
         primes=[primes x]
     end
 end
 primes