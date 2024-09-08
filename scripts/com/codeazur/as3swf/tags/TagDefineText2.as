package com.codeazur.as3swf.tags
{
   import com.codeazur.utils.StringUtils;
   
   public class TagDefineText2 extends TagDefineText implements IDefinitionTag
   {
      public static const TYPE:uint = 33;
      
      public function TagDefineText2()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return TYPE;
      }
      
      override public function get name() : String
      {
         return "DefineText2";
      }
      
      override public function get version() : uint
      {
         return 3;
      }
      
      override public function get level() : uint
      {
         return 2;
      }
      
      override public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + characterId + ", " + "Bounds: " + textBounds + ", " + "Matrix: " + textMatrix;
         if(_records.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "TextRecords:";
            _loc4_ = 0;
            while(_loc4_ < _records.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + _records[_loc4_].toString();
               _loc4_++;
            }
         }
         return _loc3_;
      }
   }
}

