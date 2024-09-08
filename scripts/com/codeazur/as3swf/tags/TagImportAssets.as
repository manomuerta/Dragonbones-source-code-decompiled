package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFSymbol;
   import com.codeazur.utils.StringUtils;
   
   public class TagImportAssets implements ITag
   {
      public static const TYPE:uint = 57;
      
      public var url:String;
      
      protected var _symbols:Vector.<SWFSymbol>;
      
      public function TagImportAssets()
      {
         super();
         this._symbols = new Vector.<SWFSymbol>();
      }
      
      public function get symbols() : Vector.<SWFSymbol>
      {
         return this._symbols;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this.url = param1.readString();
         var _loc5_:uint = param1.readUI16();
         var _loc6_:uint = 0;
         while(_loc6_ < _loc5_)
         {
            this._symbols.push(param1.readSYMBOL());
            _loc6_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:SWFData = new SWFData();
         _loc3_.writeString(this.url);
         var _loc4_:uint = this._symbols.length;
         _loc3_.writeUI16(_loc4_);
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_.writeSYMBOL(this._symbols[_loc5_]);
            _loc5_++;
         }
         param1.writeTagHeader(this.type,_loc3_.length);
         param1.writeBytes(_loc3_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "ImportAssets";
      }
      
      public function get version() : uint
      {
         return 5;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1);
         if(this._symbols.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Assets:";
            _loc4_ = 0;
            while(_loc4_ < this._symbols.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._symbols[_loc4_].toString();
               _loc4_++;
            }
         }
         return _loc3_;
      }
   }
}

