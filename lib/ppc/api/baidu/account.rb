module PPC
  module API
    class Baidu
      class Account< Baidu
        Service = 'Account'

        @map = [
                          [:id,:userid],            
                          [:balance,:balance],         
                          [:cost,:cost],               
                          [:payment,:payment],                          
                          [:status,:userStat],                            
                          [:budget_type,:budgetType],                   
                          [:budget,:budget],                              
                          [:region,:regionTarget],                    
                          [:exclude_ip,:excludeIp],                        
                          [:isdynamic,:isDynamicCreative],         
                          [:dynamic_param,:dynamicCreativeParam], 
                          [:open_domains,:openDomains],                  
                          [:reg_domain,:regDomain],                       
                          [:offline_time,:budgetOfflineTime],         
                          [:weekly_budget,:weeklyBudget],                
                          [:opt,:opt]                                  
                        ]

        def self.info(auth, debug = false)
          response = request(auth,Service,'getAccountInfo'  )
          return process( response, 'accountInfoType', debug ){ |x|reverse_type(x) }
        end

        def self.update(auth, param = {}, debug = false)
          """
          update account info
          @ params : account_info_type
          @return : account info_type
          """
          # for account service, there is not bulk operation
          infoType = make_type( param )[0]
          body = { accountInfoType: infoType }
          response = request(auth,Service,'updateAccountInfo', body)
          return process( response, 'accountInfoType', debug ){ |x|reverse_type(x) }
        end

      end
    end
  end
end
