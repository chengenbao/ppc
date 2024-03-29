module PPC
  class Baidu
    class BulkException < Exception
      attr_reader :file_id,:bulk,:exception
      def initialize(file_id,bulk,exception)
        @file_id    = file_id
        @bulk       = bulk
        @exception  = exception
      end
    end

    class Bulk < ::PPC::Baidu
      def initialize(params = {})
        params[:service] = 'BulkJob'
        super(params)
      end

      def file_id_of_all(params = {})
        plan_ids = params[:plan_ids]

        unless plan_ids.nil?
          plan_ids = plan_ids.class == Array ? plan_ids : [plan_ids]
        end

        options = {
          campaignIds:              plan_ids              || []      ,
          includeQuality:           params[:quality]      || true    ,
          includeTemp:              params[:temp]         || false   ,
          format:                   params[:format]       || 1       ,
          newCreativeFiles:         params[:adcopy]       || 0       ,
          includeTempNewCreatives:  params[:temp_adcopy]  || 0       ,
          includePhraseType:        params[:phrase]       || 0       ,
          extended:                 params[:extended]     || 0
        }
        response = request('getAllObjects',options)

        body = response[:envelope][:body]
        raise "no result" if body.nil?
        body[:get_all_objects_response][:file_id]
      end

      def state(id)
        raise "empty id" if id.nil? or id.empty?
        request('getFileState',{fileId:id})[:envelope][:body][:get_file_state_response][:is_generated]
      end

      def path(id)
        request('getFilePath',{fileId:id})[:envelope][:body][:get_file_path_response][:file_paths]
      end
    end
  end
end
