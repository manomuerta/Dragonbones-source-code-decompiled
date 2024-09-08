package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.consts.BitmapType;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class TagDefineBits implements IDefinitionTag
   {
      public static const TYPE:uint = 6;
      
      public var bitmapType:uint = 1;
      
      protected var _characterId:uint;
      
      protected var _bitmapData:ByteArray;
      
      public var bitmapWidth:Number;
      
      public var bitmapHeight:Number;
      
      public var _15076:Boolean = true;
      
      public var _15075:int;
      
      public var _15077:Boolean = false;
      
      protected var loader:Loader;
      
      protected var onCompleteCallback:Function;
      
      public function TagDefineBits()
      {
         super();
         this._bitmapData = new ByteArray();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get bitmapData() : ByteArray
      {
         return this._bitmapData;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         this._characterId = param1.readUI16();
         if(param2 > 2)
         {
            param1.readBytes(this._bitmapData,0,param2 - 2);
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         param1.writeTagHeader(this.type,this._bitmapData.length + 2,true);
         param1.writeUI16(this._characterId);
         if(this._bitmapData.length > 0)
         {
            param1.writeBytes(this._bitmapData);
         }
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:TagDefineBits = new TagDefineBits();
         _loc1_.characterId = this.characterId;
         _loc1_.bitmapType = this.bitmapType;
         if(this._bitmapData.length > 0)
         {
            _loc1_.bitmapData.writeBytes(this._bitmapData);
         }
         return _loc1_;
      }
      
      public function exportBitmapData(param1:Function, param2:TagJPEGTables = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:ByteArray = null;
         var _loc6_:ByteArray = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.onCompleteCallback = param1;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.exportCompleteHandler);
         var _loc3_:ByteArray = this._bitmapData;
         if(this.type == TagDefineBits.TYPE && Boolean(param2))
         {
            _loc3_ = new ByteArray();
            _loc3_.writeBytes(param2.jpegTables);
            _loc3_.writeBytes(this._bitmapData);
         }
         if(this.bitmapType == BitmapType.JPEG && _loc3_[3] < 224)
         {
            _loc4_ = 3;
            _loc5_ = new ByteArray();
            while(_loc8_ = int(_loc3_[_loc4_]), !(_loc8_ >= 224 && _loc8_ <= 238))
            {
               if(_loc8_ == 216 || _loc8_ == 217)
               {
                  _loc4_ += 2;
               }
               else
               {
                  _loc9_ = (_loc3_[_loc4_ + 1] << 8) + _loc3_[_loc4_ + 2];
                  _loc5_.writeBytes(_loc3_,_loc4_ - 1,_loc9_ + 2);
                  _loc4_ += _loc9_ + 2;
               }
            }
            _loc6_ = new ByteArray();
            _loc6_.writeShort(65496);
            _loc7_ = (_loc3_[_loc4_ + 1] << 8) + _loc3_[_loc4_ + 2];
            _loc6_.writeBytes(_loc3_,_loc4_ - 1,_loc7_ + 2);
            _loc6_.writeBytes(_loc5_);
            _loc6_.writeBytes(_loc3_,_loc4_ + _loc7_ + 1);
            this.loader.loadBytes(_loc6_);
            return;
         }
         this.loader.loadBytes(_loc3_);
      }
      
      protected function exportCompleteHandler(param1:Event) : void
      {
         var _loc2_:Loader = param1.target.loader as Loader;
         var _loc3_:BitmapData = new BitmapData(_loc2_.content.width,_loc2_.content.height);
         _loc3_.draw(_loc2_);
         this.bitmapWidth = _loc2_.content.width;
         this.bitmapHeight = _loc2_.content.height;
         this.onCompleteCallback(_loc3_,this);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineBits";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         return Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", " + "BitmapLength: " + this._bitmapData.length;
      }
   }
}

