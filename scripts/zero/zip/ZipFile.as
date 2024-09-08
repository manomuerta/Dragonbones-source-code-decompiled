package zero.zip
{
   import flash.utils.ByteArray;
   import zero.BytesAndStr16;
   import zero.codec.CRC32;
   import zero.codec.DOSTime;
   
   public class ZipFile
   {
      private var version_made_by:int;
      
      private var version_needed_to_extract:int;
      
      private var general_purpose_bit_flag:int;
      
      private var compression_method:int;
      
      private var date_and_time_fields:int;
      
      private var crc32:int;
      
      private var compressed_size:int;
      
      private var uncompressed_size:int;
      
      private var disk_number_start:int;
      
      private var internal_file_attributes:int;
      
      private var external_file_attributes:int;
      
      internal var relative_offset_of_local_header:int;
      
      private var file_name:ByteArray;
      
      private var file_name_charset:String;
      
      private var extra_field1:ByteArray;
      
      private var extra_field2:ByteArray;
      
      private var file_data0:ByteArray;
      
      private var file_data:ByteArray;
      
      private var file_comment:ByteArray;
      
      private var file_comment_charset:String;
      
      private var _08074b50:Boolean;
      
      public function ZipFile(param1:String = "gb2312", param2:String = "gb2312")
      {
         super();
         this.version_made_by = 20;
         this.version_needed_to_extract = 20;
         this.general_purpose_bit_flag = 0;
         this.disk_number_start = 0;
         this.internal_file_attributes = 0;
         this.external_file_attributes = 0;
         this.file_name_charset = param1;
         this.file_comment_charset = param2;
         this.date = new Date();
      }
      
      public function get name() : String
      {
         if(this.file_name)
         {
            if(this.file_name.length)
            {
               this.file_name.position = 0;
               return this.file_name.readMultiByte(this.file_name.length,this.file_name_charset);
            }
            this.file_name = null;
         }
         return "";
      }
      
      public function set name(param1:String) : void
      {
         if(param1)
         {
            this.file_name = new ByteArray();
            this.file_name.writeMultiByte(param1,this.file_name_charset);
         }
         else
         {
            this.file_name = null;
         }
      }
      
      public function get isDirectory() : Boolean
      {
         var _loc1_:String = this.name;
         if(_loc1_)
         {
            return _loc1_.lastIndexOf("/") == _loc1_.length - 1;
         }
         return false;
      }
      
      public function set isDirectory(param1:Boolean) : void
      {
         var _loc2_:String = this.name;
         if(_loc2_)
         {
            if(_loc2_.lastIndexOf("/") == _loc2_.length - 1)
            {
               if(!param1)
               {
                  this.name = _loc2_.substr(0,_loc2_.length - 1);
               }
            }
            else if(param1)
            {
               this.name = _loc2_ + "/";
            }
         }
         else if(param1)
         {
            throw new Error("name 为 \"\" 时不允许 isDirectory=true");
         }
      }
      
      public function get date() : Date
      {
         return DOSTime.decode(this.date_and_time_fields);
      }
      
      public function set date(param1:Date) : void
      {
         this.date_and_time_fields = DOSTime.encode(param1);
      }
      
      public function get data() : ByteArray
      {
         var _loc1_:ByteArray = null;
         if(this.file_data)
         {
            if(this.file_data.length)
            {
               _loc1_ = new ByteArray();
               _loc1_.writeBytes(this.file_data);
               return _loc1_;
            }
            this.file_data = null;
         }
         return new ByteArray();
      }
      
      public function set data(param1:ByteArray) : void
      {
         this.general_purpose_bit_flag &= 4294967280;
         if(Boolean(param1) && Boolean(param1.length))
         {
            this.file_data = new ByteArray();
            this.file_data.writeBytes(param1);
            this.file_data0 = new ByteArray();
            this.file_data0.writeBytes(this.file_data);
            this.file_data0.deflate();
            if(this.file_data0.length < this.file_data.length)
            {
               this.compression_method = 8;
            }
            else
            {
               this.file_data0 = this.file_data;
               this.compression_method = 0;
            }
            this.crc32 = CRC32(this.file_data);
         }
         else
         {
            this.file_data0 = null;
            this.file_data = null;
            this.compression_method = 0;
            this.crc32 = 0;
         }
      }
      
      public function get comment() : String
      {
         if(this.file_comment)
         {
            if(this.file_comment.length)
            {
               this.file_comment.position = 0;
               return this.file_comment.readMultiByte(this.file_comment.length,this.file_comment_charset);
            }
            this.file_comment = null;
         }
         return "";
      }
      
      public function set comment(param1:String) : void
      {
         if(param1)
         {
            this.file_comment = new ByteArray();
            this.file_comment.writeMultiByte(param1,this.file_comment_charset);
         }
         else
         {
            this.file_comment = null;
         }
      }
      
      public function clear() : void
      {
         this.file_name = null;
         this.extra_field1 = null;
         this.extra_field2 = null;
         this.file_data0 = null;
         this.file_data = null;
         this.file_comment = null;
      }
      
      internal function initByCentralDirectoryData(param1:ByteArray, param2:int) : int
      {
         this.version_made_by = param1[param2++] | param1[param2++] << 8;
         this.version_needed_to_extract = param1[param2++] | param1[param2++] << 8;
         this.general_purpose_bit_flag = param1[param2++] | param1[param2++] << 8;
         this.compression_method = param1[param2++] | param1[param2++] << 8;
         this.date_and_time_fields = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
         this.crc32 = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
         this.compressed_size = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
         this.uncompressed_size = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
         var _loc3_:* = param1[param2++] | param1[param2++] << 8;
         var _loc4_:* = param1[param2++] | param1[param2++] << 8;
         var _loc5_:* = param1[param2++] | param1[param2++] << 8;
         this.disk_number_start = param1[param2++] | param1[param2++] << 8;
         this.internal_file_attributes = param1[param2++] | param1[param2++] << 8;
         this.external_file_attributes = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
         this.relative_offset_of_local_header = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
         if(_loc3_)
         {
            this.file_name = new ByteArray();
            this.file_name.writeBytes(param1,param2,_loc3_);
            param2 += _loc3_;
         }
         else
         {
            this.file_name = null;
         }
         if(_loc4_)
         {
            this.extra_field1 = new ByteArray();
            this.extra_field1.writeBytes(param1,param2,_loc4_);
            param2 += _loc4_;
         }
         else
         {
            this.extra_field1 = null;
         }
         if(_loc5_)
         {
            this.file_comment = new ByteArray();
            this.file_comment.writeBytes(param1,_loc5_);
            param2 += _loc5_;
         }
         else
         {
            this.file_comment = null;
         }
         return param2;
      }
      
      private function outputError(param1:String, param2:Boolean) : void
      {
         param1 = this.name + "，" + param1;
         if(param2)
         {
            throw new Error(param1);
         }
         trace(param1);
      }
      
      internal function initByZipData(param1:ByteArray, param2:int, param3:Boolean) : int
      {
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         if(this.version_needed_to_extract != (param1[param2++] | param1[param2++] << 8))
         {
            this.outputError("version_needed_to_extract 不一致",param3);
         }
         if(this.general_purpose_bit_flag != (param1[param2++] | param1[param2++] << 8))
         {
            this.outputError("general_purpose_bit_flag 不一致",param3);
         }
         if(this.compression_method != (param1[param2++] | param1[param2++] << 8))
         {
            this.outputError("compression_method 不一致",param3);
         }
         if(this.date_and_time_fields != (param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24))
         {
            this.outputError("date_and_time_fields 不一致",param3);
         }
         if(this.general_purpose_bit_flag & 8)
         {
            param2 += 12;
         }
         else
         {
            if(this.crc32 != (param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24))
            {
               this.outputError("crc32 不一致",param3);
            }
            if(this.compressed_size != (param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24))
            {
               this.outputError("compressed_size 不一致",param3);
            }
            if(this.uncompressed_size != (param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24))
            {
               this.outputError("uncompressed_size 不一致",param3);
            }
         }
         var _loc4_:* = param1[param2++] | param1[param2++] << 8;
         var _loc5_:* = param1[param2++] | param1[param2++] << 8;
         if(_loc4_)
         {
            if(BytesAndStr16.bytes2str16(this.file_name,0,this.file_name.length) != BytesAndStr16.bytes2str16(param1,param2,_loc4_))
            {
               param1.position = param2;
               this.outputError("file_name 不一致（" + param1.readMultiByte(_loc4_,this.file_name_charset) + "）",param3);
            }
            param2 += _loc4_;
         }
         else if(this.file_name)
         {
            this.outputError("file_name 不一致",param3);
         }
         if(_loc5_)
         {
            this.extra_field2 = new ByteArray();
            this.extra_field2.writeBytes(param1,param2,_loc5_);
            param2 += _loc5_;
         }
         else
         {
            this.extra_field2 = null;
         }
         if(this.compressed_size)
         {
            this.file_data0 = new ByteArray();
            this.file_data0.writeBytes(param1,param2,this.compressed_size);
            switch(this.compression_method)
            {
               case 0:
                  this.file_data = this.file_data0;
                  break;
               case 8:
                  this.file_data = new ByteArray();
                  this.file_data.writeBytes(this.file_data0);
                  this.file_data.inflate();
                  break;
               default:
                  throw new Error("暂不支持的压缩方式：" + this.compression_method);
            }
            _loc6_ = CRC32(this.file_data);
            param2 += this.compressed_size;
         }
         else
         {
            this.file_data0 = null;
            this.file_data = null;
            _loc6_ = 0;
         }
         if(this.general_purpose_bit_flag & 8)
         {
            _loc7_ = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
            if(_loc7_ == 134695760)
            {
               this._08074b50 = true;
               _loc7_ = param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24;
            }
            else
            {
               this._08074b50 = false;
            }
            if(this.crc32 != _loc7_)
            {
               this.outputError("crc32 不一致",param3);
            }
            if(this.compressed_size != (param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24))
            {
               this.outputError("compressed_size 不一致",param3);
            }
            if(this.uncompressed_size != (param1[param2++] | param1[param2++] << 8 | param1[param2++] << 16 | param1[param2++] << 24))
            {
               this.outputError("uncompressed_size 不一致",param3);
            }
         }
         if(this.crc32 != _loc6_)
         {
            this.outputError("crc32 和 data_crc32 不一致",param3);
         }
         return param2;
      }
      
      internal function toZipDataArr(param1:int) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:ByteArray = new ByteArray();
         _loc3_[0] = this.version_made_by;
         _loc3_[1] = this.version_made_by >> 8;
         _loc3_[2] = _loc2_[0] = this.version_needed_to_extract;
         _loc3_[3] = _loc2_[1] = this.version_needed_to_extract >> 8;
         _loc3_[4] = _loc2_[2] = this.general_purpose_bit_flag;
         _loc3_[5] = _loc2_[3] = this.general_purpose_bit_flag >> 8;
         if(Boolean(this.file_data) && Boolean(this.file_data.length))
         {
            _loc4_ = int(this.file_data0.length);
            _loc5_ = int(this.file_data.length);
         }
         else
         {
            _loc4_ = 0;
            _loc5_ = 0;
         }
         _loc3_[6] = _loc2_[4] = this.compression_method;
         _loc3_[7] = _loc2_[5] = this.compression_method >> 8;
         _loc3_[8] = _loc2_[6] = this.date_and_time_fields;
         _loc3_[9] = _loc2_[7] = this.date_and_time_fields >> 8;
         _loc3_[10] = _loc2_[8] = this.date_and_time_fields >> 16;
         _loc3_[11] = _loc2_[9] = this.date_and_time_fields >> 24;
         if(this.general_purpose_bit_flag & 8)
         {
            _loc2_[10] = 0;
            _loc2_[11] = 0;
            _loc2_[12] = 0;
            _loc2_[13] = 0;
            _loc2_[14] = 0;
            _loc2_[15] = 0;
            _loc2_[16] = 0;
            _loc2_[17] = 0;
            _loc2_[18] = 0;
            _loc2_[19] = 0;
            _loc2_[20] = 0;
            _loc2_[21] = 0;
         }
         else
         {
            _loc2_[10] = this.crc32;
            _loc2_[11] = this.crc32 >> 8;
            _loc2_[12] = this.crc32 >> 16;
            _loc2_[13] = this.crc32 >> 24;
            _loc2_[14] = _loc4_;
            _loc2_[15] = _loc4_ >> 8;
            _loc2_[16] = _loc4_ >> 16;
            _loc2_[17] = _loc4_ >> 24;
            _loc2_[18] = _loc5_;
            _loc2_[19] = _loc5_ >> 8;
            _loc2_[20] = _loc5_ >> 16;
            _loc2_[21] = _loc5_ >> 24;
         }
         _loc3_[12] = this.crc32;
         _loc3_[13] = this.crc32 >> 8;
         _loc3_[14] = this.crc32 >> 16;
         _loc3_[15] = this.crc32 >> 24;
         _loc3_[16] = _loc4_;
         _loc3_[17] = _loc4_ >> 8;
         _loc3_[18] = _loc4_ >> 16;
         _loc3_[19] = _loc4_ >> 24;
         _loc3_[20] = _loc5_;
         _loc3_[21] = _loc5_ >> 8;
         _loc3_[22] = _loc5_ >> 16;
         _loc3_[23] = _loc5_ >> 24;
         if(Boolean(this.file_name) && Boolean(this.file_name.length))
         {
            _loc2_.position = 26;
            _loc2_.writeBytes(this.file_name);
            _loc6_ = int(_loc2_.length);
            _loc3_.position = 42;
            _loc3_.writeBytes(this.file_name);
            _loc7_ = int(_loc3_.length);
            _loc8_ = _loc6_ - 26;
            _loc3_[24] = _loc2_[22] = _loc8_;
            _loc3_[25] = _loc2_[23] = _loc8_ >> 8;
         }
         else
         {
            this.file_name = null;
            _loc6_ = 26;
            _loc7_ = 42;
            _loc3_[24] = _loc2_[22] = 0;
            _loc3_[25] = _loc2_[23] = 0;
         }
         if(Boolean(this.extra_field2) && Boolean(this.extra_field2.length))
         {
            _loc2_.position = _loc6_;
            _loc2_.writeBytes(this.extra_field2);
            _loc9_ = int(this.extra_field2.length);
            _loc6_ += _loc9_;
            _loc2_[24] = _loc9_;
            _loc2_[25] = _loc9_ >> 8;
         }
         else
         {
            this.extra_field2 = null;
            _loc2_[24] = 0;
            _loc2_[25] = 0;
         }
         if(Boolean(this.extra_field1) && Boolean(this.extra_field1.length))
         {
            _loc3_.position = _loc7_;
            _loc3_.writeBytes(this.extra_field1);
            _loc9_ = int(this.extra_field1.length);
            _loc7_ += _loc9_;
            _loc3_[26] = _loc9_;
            _loc3_[27] = _loc9_ >> 8;
         }
         else
         {
            this.extra_field1 = null;
            _loc3_[26] = 0;
            _loc3_[27] = 0;
         }
         if(Boolean(this.file_comment) && Boolean(this.file_comment.length))
         {
            _loc3_.position = _loc7_;
            _loc3_.writeBytes(this.file_comment);
            _loc10_ = _loc3_.length - _loc7_;
            _loc7_ += _loc10_;
            _loc3_[28] = _loc10_;
            _loc3_[29] = _loc10_ >> 8;
         }
         else
         {
            this.file_comment = null;
            _loc3_[28] = 0;
            _loc3_[29] = 0;
         }
         _loc3_[30] = this.disk_number_start;
         _loc3_[31] = this.disk_number_start >> 8;
         _loc3_[32] = this.internal_file_attributes;
         _loc3_[33] = this.internal_file_attributes >> 8;
         _loc3_[34] = this.external_file_attributes;
         _loc3_[35] = this.external_file_attributes >> 8;
         _loc3_[36] = this.external_file_attributes >> 16;
         _loc3_[37] = this.external_file_attributes >> 24;
         _loc3_[38] = param1;
         _loc3_[39] = param1 >> 8;
         _loc3_[40] = param1 >> 16;
         _loc3_[41] = param1 >> 24;
         if(this.file_data0)
         {
            _loc2_.position = _loc6_;
            _loc2_.writeBytes(this.file_data0);
            _loc6_ += _loc4_;
         }
         if(this.general_purpose_bit_flag & 8)
         {
            if(this._08074b50)
            {
               var _loc11_:*;
               _loc2_[_loc11_ = _loc6_++] = 80;
               var _loc12_:*;
               _loc2_[_loc12_ = _loc6_++] = 75;
               var _loc13_:*;
               _loc2_[_loc13_ = _loc6_++] = 7;
               var _loc14_:*;
               _loc2_[_loc14_ = _loc6_++] = 8;
            }
            _loc2_[_loc11_ = _loc6_++] = this.crc32;
            _loc2_[_loc12_ = _loc6_++] = this.crc32 >> 8;
            _loc2_[_loc13_ = _loc6_++] = this.crc32 >> 16;
            _loc2_[_loc14_ = _loc6_++] = this.crc32 >> 24;
            var _loc15_:*;
            _loc2_[_loc15_ = _loc6_++] = _loc4_;
            var _loc16_:*;
            _loc2_[_loc16_ = _loc6_++] = _loc4_ >> 8;
            var _loc17_:*;
            _loc2_[_loc17_ = _loc6_++] = _loc4_ >> 16;
            var _loc18_:*;
            _loc2_[_loc18_ = _loc6_++] = _loc4_ >> 24;
            var _loc19_:*;
            _loc2_[_loc19_ = _loc6_++] = _loc5_;
            var _loc20_:*;
            _loc2_[_loc20_ = _loc6_++] = _loc5_ >> 8;
            var _loc21_:*;
            _loc2_[_loc21_ = _loc6_++] = _loc5_ >> 16;
            var _loc22_:*;
            _loc2_[_loc22_ = _loc6_++] = _loc5_ >> 24;
         }
         return [_loc2_,_loc3_];
      }
      
      public function getText(param1:String = "utf-8") : String
      {
         var _loc2_:ByteArray = this.data;
         _loc2_.position = 0;
         return _loc2_.readMultiByte(_loc2_.length,param1);
      }
      
      public function setText(param1:String, param2:String = "utf-8") : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeMultiByte(param1,param2);
         this.data = _loc3_;
      }
   }
}

