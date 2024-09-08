package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   
   public class TagImportAssets2 extends TagImportAssets implements ITag
   {
      public static const TYPE:uint = 71;
      
      public function TagImportAssets2()
      {
         super();
      }
      
      override public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         url = param1.readString();
         param1.readUI8();
         param1.readUI8();
         var _loc5_:uint = param1.readUI16();
         var _loc6_:uint = 0;
         while(_loc6_ < _loc5_)
         {
            _symbols.push(param1.readSYMBOL());
            _loc6_++;
         }
      }
      
      override public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeString(url);
         _loc3_.writeUI8(1);
         _loc3_.writeUI8(0);
         var _loc4_:uint = _symbols.length;
         _loc3_.writeUI16(_loc4_);
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_.writeSYMBOL(_symbols[_loc5_]);
            _loc5_++;
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "ImportAssets2";
      }
      
      override public function get version() : uint
      {
         return 8;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
   }
}

