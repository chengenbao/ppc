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

        def self.info(auth, test = false)
          response = request(auth,Service,'getAccountInfo'  )
          return process( response, 'accountInfoType', test ){ |x|reverse_type(x) }
        end

        def self.update(auth, param = {}, test = false)
          """
          update account info
          @ params : account_info_type
          @return : account info_type
          """
          # for account service, there is not bulk operation
          infoType = make_type( param )[0]
          body = { accountInfoType: infoType }
          response = request(auth,Service,'updateAccountInfo', body)
          return process( response, 'accountInfoType', test ){ |x|reverse_type(x) }
        end

        # private 
        # def self.make_info_type( param )
        #   infoType = {}
        #   infoType[:budgetType]                      =    param[:budget_type]       if    param[:budget_type] 
        #   infoType[:budget]                               =   param[:budget]                 if    param[:budget]
        #   infoType[:regionTarget]                     =   param[:region]                  if    param[:region]
        #   infoType[:excludeIp]                          =   param[:exclude_ip]          if    param[:exclude_ip]  
        #   infoType[:isDynamicCreative]           =  param[:isdynamic]           if    param[:isdynamic]
        #   infoType[:dynamicCreativeParam]  = param[:dynamic_param]  if    param[:dynamic_param]
        #   return infoType
        # end

        # def self.reverse_info_type( infotype )
        #   account_api = {}
        #   account_api[:id]                          = infotype['userid']                               if  infotype['userid']  
        #   account_api[:balance]               = infotype['balance']                             if infotype['balance'] 
        #   account_api[:cost]                      = infotype['cost']                                    if  infotype['cost']  
        #   account_api[:payment]             = infotype['payment']                           if  infotype['payment']
        #   account_api[:status]                  = infotype['userStat']                            if  infotype['userStat']
        #   account_api[:budget_type]       =  infotype['budgetType']                     if  infotype['budgetType'] 
        #   account_api[:budget]                = infotype['budget']                               if infotype['budget']
        #   account_api[:region]                 = infotype['regionTarget']                     if  infotype['regionTarget']
        #   account_api[:exclude_ip]          =  infotype['excludeIp']                         if infotype['excludeIp']  
        #   account_api[:isdynamic]           = infotype['isDynamicCreative']          if infotype['isDynamicCreative']
        #   account_api[:dynamic_param] = infotype['dynamicCreativeParam'] if infotype['dynamicCreativeParam']
        #   account_api[:open_domains]   = infotype['openDomains']                  if infotype['openDomains']
        #   account_api[:reg_domain]         = infotype['regDomain']                       if infotype['regDomain']
        #   account_api[:offline_time]         = infotype['budgetOfflineTime']          if infotype['budgetOfflineTime']
        #   account_api[:weekly_budget]     = infotype['weeklyBudget']                   if infotype['weeklyBudget']
        #   account_api[:opt]                         = infotype['opt']                                     if infotype['opt']

        #   return account_api
        # end

      end
    end
  end
end
