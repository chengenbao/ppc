describe ::PPC::API::Qihu::Plan do
  auth = {}
  auth[:token] = $qihu_token
  auth[:accessToken] = $qihu_accessToken

  test_plan_id = 0

  it 'can add plan' do
    response = ::PPC::API::Qihu::Plan::add( auth, {name:'planForTest'})
    is_success( response )
    test_plan_id = response[:result]
  end

  it 'can get plan' do
    response = ::PPC::API::Qihu::Plan::get( auth, test_plan_id )
    is_success( response )
  end
  
  it 'can update plan' do
    response = ::PPC::API::Qihu::Plan::update( auth, { id:test_plan_id, name:'planUpdateTest' } )
    is_success( response )
  end
  
  it 'can delete plan ' do
    response = ::PPC::API::Qihu::Plan::delete( auth , test_plan_id  )
    is_success( response )
  end

end