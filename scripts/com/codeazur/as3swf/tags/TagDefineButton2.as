package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFButtonCondAction;
   import com.codeazur.as3swf.data.SWFButtonRecord;
   import com.codeazur.utils.StringUtils;
   import flash.utils.Dictionary;
   
   public class TagDefineButton2 implements IDefinitionTag
   {
      public static const TYPE:uint = 34;
      
      public var trackAsMenu:Boolean;
      
      protected var _characterId:uint;
      
      protected var _characters:Vector.<SWFButtonRecord>;
      
      protected var _condActions:Vector.<SWFButtonCondAction>;
      
      protected var frames:Dictionary;
      
      public function TagDefineButton2()
      {
         super();
         this._characters = new Vector.<SWFButtonRecord>();
         this._condActions = new Vector.<SWFButtonCondAction>();
         this.frames = new Dictionary();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get characters() : Vector.<SWFButtonRecord>
      {
         return this._characters;
      }
      
      public function get condActions() : Vector.<SWFButtonCondAction>
      {
         return this._condActions;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc6_:SWFButtonRecord = null;
         var _loc7_:uint = 0;
         this._characterId = param1.readUI16();
         this.trackAsMenu = (param1.readUI8() & 1) != 0;
         var _loc5_:uint = param1.readUI16();
         while(_loc6_ = param1.readBUTTONRECORD(2), _loc6_ != null)
         {
            this.characters.push(_loc6_);
         }
         if(_loc5_ != 0)
         {
            do
            {
               _loc7_ = param1.readUI16();
               this.condActions.push(param1.readBUTTONCONDACTION());
            }
            while(_loc7_ != 0);
            
         }
         this.processRecords();
      }
      
      public function _15078() : Array
      {
         return [this.frames[TagDefineButton.STATE_UP],this.frames[TagDefineButton.STATE_OVER],this.frames[TagDefineButton.STATE_DOWN],this.frames[TagDefineButton.STATE_HIT]];
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:uint = 0;
         var _loc7_:SWFData = null;
         var _loc4_:SWFData = new SWFData();
         _loc4_.writeUI16(this.characterId);
         _loc4_.writeUI8(this.trackAsMenu ? 1 : 0);
         var _loc5_:* = this.condActions.length > 0;
         var _loc6_:SWFData = new SWFData();
         _loc3_ = 0;
         while(_loc3_ < this.characters.length)
         {
            _loc6_.writeBUTTONRECORD(this.characters[_loc3_],2);
            _loc3_++;
         }
         _loc6_.writeUI8(0);
         _loc4_.writeUI16(_loc5_ ? uint(_loc6_.length + 2) : 0);
         _loc4_.writeBytes(_loc6_);
         if(_loc5_)
         {
            _loc3_ = 0;
            while(_loc3_ < this.condActions.length)
            {
               _loc7_ = new SWFData();
               _loc7_.writeBUTTONCONDACTION(this.condActions[_loc3_]);
               _loc4_.writeUI16(_loc3_ < this.condActions.length - 1 ? uint(_loc7_.length + 2) : 0);
               _loc4_.writeBytes(_loc7_);
               _loc3_++;
            }
         }
         param1.writeTagHeader(this.type,_loc4_.length);
         param1.writeBytes(_loc4_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:uint = 0;
         var _loc2_:TagDefineButton2 = new TagDefineButton2();
         _loc2_.characterId = this.characterId;
         _loc2_.trackAsMenu = this.trackAsMenu;
         _loc1_ = 0;
         while(_loc1_ < this.characters.length)
         {
            _loc2_.characters.push(this.characters[_loc1_].clone());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.condActions.length)
         {
            _loc2_.condActions.push(this.condActions[_loc1_].clone());
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function getRecordsByState(param1:String) : Vector.<SWFButtonRecord>
      {
         return this.frames[param1] as Vector.<SWFButtonRecord>;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineButton2";
      }
      
      public function get version() : uint
      {
         return 3;
      }
      
      public function get level() : uint
      {
         return 2;
      }
      
      protected function processRecords() : void
      {
         var _loc6_:SWFButtonRecord = null;
         var _loc1_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc2_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc3_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc4_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc5_:uint = 0;
         while(_loc5_ < this.characters.length)
         {
            _loc6_ = this.characters[_loc5_];
            if(_loc6_.stateUp)
            {
               _loc1_.push(_loc6_);
            }
            if(_loc6_.stateOver)
            {
               _loc2_.push(_loc6_);
            }
            if(_loc6_.stateDown)
            {
               _loc3_.push(_loc6_);
            }
            if(_loc6_.stateHitTest)
            {
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         this.frames[TagDefineButton.STATE_UP] = _loc1_.sort(this.sortByDepthCompareFunction);
         this.frames[TagDefineButton.STATE_OVER] = _loc2_.sort(this.sortByDepthCompareFunction);
         this.frames[TagDefineButton.STATE_DOWN] = _loc3_.sort(this.sortByDepthCompareFunction);
         this.frames[TagDefineButton.STATE_HIT] = _loc4_.sort(this.sortByDepthCompareFunction);
      }
      
      protected function sortByDepthCompareFunction(param1:SWFButtonRecord, param2:SWFButtonRecord) : Number
      {
         if(param1.placeDepth < param2.placeDepth)
         {
            return -1;
         }
         if(param1.placeDepth > param2.placeDepth)
         {
            return 1;
         }
         return 0;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this.characterId + ", TrackAsMenu: " + this.trackAsMenu;
         if(this._characters.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Characters:";
            _loc4_ = 0;
            while(_loc4_ < this._characters.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._characters[_loc4_].toString(param1 + 4);
               _loc4_++;
            }
         }
         if(this._condActions.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "CondActions:";
            _loc4_ = 0;
            while(_loc4_ < this._condActions.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._condActions[_loc4_].toString(param1 + 4,param2);
               _loc4_++;
            }
         }
         return _loc3_;
      }
   }
}

