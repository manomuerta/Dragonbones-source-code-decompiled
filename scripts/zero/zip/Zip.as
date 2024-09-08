package zero.zip
{
   import flash.utils.ByteArray;
   
   public class Zip
   {
      public var fileV:Vector.<ZipFile>;
      
      private var number_of_this_disk:int;
      
      private var number_of_the_disk_with_the_start_of_the_central_directory:int;
      
      private var zipfile_comment:ByteArray;
      
      private var zipfile_comment_charset:String;
      
      public function Zip()
      {
         super();
         this.fileV = new Vector.<ZipFile>();
         this.number_of_this_disk = 0;
         this.number_of_the_disk_with_the_start_of_the_central_directory = 0;
         this.zipfile_comment_charset = "gb2312";
      }
      
      public function get comment() : String
      {
         if(this.zipfile_comment)
         {
            if(this.zipfile_comment.length)
            {
               this.zipfile_comment.position = 0;
               return this.zipfile_comment.readMultiByte(this.zipfile_comment.length,this.zipfile_comment_charset);
            }
            this.zipfile_comment = null;
         }
         return "";
      }
      
      public function set comment(param1:String) : void
      {
         if(param1)
         {
            this.zipfile_comment = new ByteArray();
            this.zipfile_comment.writeMultiByte(param1,this.zipfile_comment_charset);
         }
         else
         {
            this.zipfile_comment = null;
         }
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         if(this.fileV)
         {
            _loc1_ = int(this.fileV.length);
            while(--_loc1_ >= 0)
            {
               this.fileV[_loc1_].clear();
               this.fileV[_loc1_] = null;
            }
            this.fileV.length = 0;
            this.fileV = null;
         }
         this.zipfile_comment = null;
      }
      
      public function decode(param1:ByteArray, param2:String = "gb2312", param3:String = "gb2312", param4:Boolean = false) : void
      {
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:ZipFile = null;
         var _loc5_:int = int(param1.length);
         while(true)
         {
            if(--_loc5_ <= 0)
            {
               if(param4)
               {
                  throw new Error("严格模式下解压 zip 失败");
               }
               throw new Error("非严格模式下解压 zip 失败");
            }
            if(param1[_loc5_] == 80)
            {
               if(param1[_loc5_ + 1] == 75)
               {
                  if(param1[_loc5_ + 2] == 5)
                  {
                     if(param1[_loc5_ + 3] == 6)
                     {
                        _loc6_ = param1[_loc5_ + 20] | param1[_loc5_ + 21] << 8;
                        if(_loc5_ + 22 + _loc6_ == param1.length)
                        {
                           this.number_of_this_disk = param1[_loc5_ + 4] | param1[_loc5_ + 5] << 8;
                           this.number_of_the_disk_with_the_start_of_the_central_directory = param1[_loc5_ + 6] | param1[_loc5_ + 7] << 8;
                           _loc7_ = param1[_loc5_ + 8] | param1[_loc5_ + 9] << 8;
                           _loc8_ = param1[_loc5_ + 10] | param1[_loc5_ + 11] << 8;
                           _loc9_ = param1[_loc5_ + 12] | param1[_loc5_ + 13] << 8 | param1[_loc5_ + 14] << 16 | param1[_loc5_ + 15] << 24;
                           _loc10_ = param1[_loc5_ + 16] | param1[_loc5_ + 17] << 8 | param1[_loc5_ + 18] << 16 | param1[_loc5_ + 19] << 24;
                           if(_loc6_)
                           {
                              this.zipfile_comment = new ByteArray();
                              this.zipfile_comment.writeBytes(param1,_loc5_ + 22,_loc6_);
                           }
                           else
                           {
                              this.zipfile_comment = null;
                           }
                           if(!param2)
                           {
                              param2 = "gb2312";
                           }
                           if(param3)
                           {
                              this.zipfile_comment_charset = param3;
                           }
                           else
                           {
                              this.zipfile_comment_charset = "gb2312";
                           }
                           if(!param4 || _loc10_ + _loc9_ == _loc5_)
                           {
                              _loc11_ = 0;
                              _loc12_ = _loc10_;
                              this.fileV = new Vector.<ZipFile>();
                              while(_loc12_ < _loc5_)
                              {
                                 if(!(param1[_loc12_++] == 80 && param1[_loc12_++] == 75 && param1[_loc12_++] == 1 && param1[_loc12_++] == 2))
                                 {
                                    trace("central file header signature 异常");
                                    break;
                                 }
                                 _loc13_ = new ZipFile(param2,param3);
                                 _loc12_ = _loc13_.initByCentralDirectoryData(param1,_loc12_);
                                 if(!(!param4 || _loc11_ == _loc13_.relative_offset_of_local_header))
                                 {
                                    trace("relative offset of local header 异常");
                                    break;
                                 }
                                 if(!param4)
                                 {
                                    _loc11_ = _loc13_.relative_offset_of_local_header;
                                 }
                                 if(!(param1[_loc11_++] == 80 && param1[_loc11_++] == 75 && param1[_loc11_++] == 3 && param1[_loc11_++] == 4))
                                 {
                                    trace("local file header signature 异常");
                                    break;
                                 }
                                 _loc11_ = _loc13_.initByZipData(param1,_loc11_,param4);
                                 this.fileV.push(_loc13_);
                              }
                              if((!param4 || _loc11_ == _loc10_) && _loc12_ == _loc5_)
                              {
                                 break;
                              }
                              trace("offset2=" + _loc12_ + "，scan_offset=" + _loc5_ + "，offset2!=scan_offset");
                              this.fileV = null;
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function encode() : ByteArray
      {
         var _loc5_:ZipFile = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc1_:ByteArray = new ByteArray();
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for each(_loc5_ in this.fileV)
         {
            _loc10_ = _loc5_.toZipDataArr(_loc3_);
            var _loc14_:*;
            _loc1_[_loc14_ = _loc3_++] = 80;
            var _loc15_:*;
            _loc1_[_loc15_ = _loc3_++] = 75;
            var _loc16_:*;
            _loc1_[_loc16_ = _loc3_++] = 3;
            var _loc17_:*;
            _loc1_[_loc17_ = _loc3_++] = 4;
            _loc1_.position = _loc3_;
            _loc1_.writeBytes(_loc10_[0]);
            _loc3_ = int(_loc1_.length);
            var _loc18_:*;
            _loc2_[_loc18_ = _loc4_++] = 80;
            var _loc19_:*;
            _loc2_[_loc19_ = _loc4_++] = 75;
            var _loc20_:*;
            _loc2_[_loc20_ = _loc4_++] = 1;
            var _loc21_:*;
            _loc2_[_loc21_ = _loc4_++] = 2;
            _loc2_.position = _loc4_;
            _loc2_.writeBytes(_loc10_[1]);
            _loc4_ = int(_loc2_.length);
         }
         _loc6_ = int(this.fileV.length);
         _loc7_ = int(this.fileV.length);
         _loc8_ = int(_loc2_.length);
         _loc9_ = _loc3_;
         _loc1_.position = _loc3_;
         _loc1_.writeBytes(_loc2_);
         _loc3_ = int(_loc1_.length);
         var _loc12_:*;
         _loc1_[_loc12_ = _loc3_++] = 80;
         var _loc13_:*;
         _loc1_[_loc13_ = _loc3_++] = 75;
         _loc1_[_loc14_ = _loc3_++] = 5;
         _loc1_[_loc15_ = _loc3_++] = 6;
         _loc1_[_loc16_ = _loc3_++] = this.number_of_this_disk;
         _loc1_[_loc17_ = _loc3_++] = this.number_of_this_disk >> 8;
         _loc1_[_loc18_ = _loc3_++] = this.number_of_the_disk_with_the_start_of_the_central_directory;
         _loc1_[_loc19_ = _loc3_++] = this.number_of_the_disk_with_the_start_of_the_central_directory >> 8;
         _loc1_[_loc20_ = _loc3_++] = _loc6_;
         _loc1_[_loc21_ = _loc3_++] = _loc6_ >> 8;
         var _loc22_:*;
         _loc1_[_loc22_ = _loc3_++] = _loc7_;
         var _loc23_:*;
         _loc1_[_loc23_ = _loc3_++] = _loc7_ >> 8;
         var _loc24_:*;
         _loc1_[_loc24_ = _loc3_++] = _loc8_;
         var _loc25_:*;
         _loc1_[_loc25_ = _loc3_++] = _loc8_ >> 8;
         var _loc26_:*;
         _loc1_[_loc26_ = _loc3_++] = _loc8_ >> 16;
         var _loc27_:*;
         _loc1_[_loc27_ = _loc3_++] = _loc8_ >> 24;
         var _loc28_:*;
         _loc1_[_loc28_ = _loc3_++] = _loc9_;
         var _loc29_:*;
         _loc1_[_loc29_ = _loc3_++] = _loc9_ >> 8;
         var _loc30_:*;
         _loc1_[_loc30_ = _loc3_++] = _loc9_ >> 16;
         var _loc31_:*;
         _loc1_[_loc31_ = _loc3_++] = _loc9_ >> 24;
         if(Boolean(this.zipfile_comment) && Boolean(this.zipfile_comment.length))
         {
            _loc1_.position = _loc3_ + 2;
            _loc1_.writeBytes(this.zipfile_comment);
            _loc11_ = _loc1_.length - _loc3_ - 2;
            var _loc32_:*;
            _loc1_[_loc32_ = _loc3_++] = _loc11_;
            var _loc33_:*;
            _loc1_[_loc33_ = _loc3_++] = _loc11_ >> 8;
         }
         else
         {
            this.zipfile_comment = null;
            _loc1_[_loc32_ = _loc3_++] = 0;
            _loc1_[_loc33_ = _loc3_++] = 0;
         }
         return _loc1_;
      }
      
      public function getFileById(param1:int) : ZipFile
      {
         return this.fileV[param1];
      }
      
      public function getFileByName(param1:String) : ZipFile
      {
         var _loc2_:ZipFile = null;
         for each(_loc2_ in this.fileV)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function removeFileByName(param1:String) : void
      {
         var _loc2_:ZipFile = null;
         for each(_loc2_ in this.fileV)
         {
            if(_loc2_.name == param1)
            {
               this.removeFile(_loc2_);
               return;
            }
         }
      }
      
      public function add(param1:*, param2:String = null, param3:Date = null) : void
      {
         var _loc4_:ZipFile = null;
         if(param1 is ZipFile)
         {
            _loc4_ = param1;
         }
         else
         {
            _loc4_ = new ZipFile();
            if(!(Boolean(param2) && param2.lastIndexOf("/") == param2.length - 1))
            {
               if(param1 is String)
               {
                  _loc4_.setText(param1);
               }
               else
               {
                  _loc4_.data = param1;
               }
            }
         }
         if(param2 is String)
         {
            _loc4_.name = param2;
         }
         if(param3)
         {
            _loc4_.date = param3;
         }
         this.addFile(_loc4_);
      }
      
      public function addFile(param1:ZipFile) : void
      {
         this.fileV.push(param1);
      }
      
      public function removeFile(param1:ZipFile) : void
      {
         var _loc2_:int = int(this.fileV.indexOf(param1));
         if(_loc2_ > -1)
         {
            this.fileV.splice(_loc2_,1);
         }
      }
   }
}

