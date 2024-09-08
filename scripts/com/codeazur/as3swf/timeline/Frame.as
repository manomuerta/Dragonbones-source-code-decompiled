package com.codeazur.as3swf.timeline
{
   import com.codeazur.as3swf.tags.TagPlaceObject;
   import com.codeazur.as3swf.tags.TagRemoveObject;
   import com.codeazur.utils.StringUtils;
   import flash.utils.Dictionary;
   
   public class Frame
   {
      public var frameNumber:uint = 0;
      
      public var tagIndexStart:uint = 0;
      
      public var tagIndexEnd:uint = 0;
      
      public var label:String;
      
      public var labels:Array;
      
      protected var _objects:Dictionary;
      
      protected var _objectsSortedByDepth:Array;
      
      protected var _characters:Array;
      
      public function Frame(param1:uint = 0, param2:uint = 0)
      {
         super();
         this.labels = [];
         this.frameNumber = param1;
         this.tagIndexStart = param2;
         this._objects = new Dictionary();
         this._characters = [];
      }
      
      public function get objects() : Dictionary
      {
         return this._objects;
      }
      
      public function set objects(param1:Dictionary) : void
      {
         this._objects = param1;
      }
      
      public function get characters() : Array
      {
         return this._characters;
      }
      
      public function getObjectsSortedByDepth() : Array
      {
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         var _loc1_:Array = [];
         if(this._objectsSortedByDepth == null)
         {
            for(_loc2_ in this._objects)
            {
               _loc1_.push(_loc2_);
            }
            _loc1_.sort(Array.NUMERIC);
            this._objectsSortedByDepth = [];
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               this._objectsSortedByDepth.push(this._objects[_loc1_[_loc3_]]);
               _loc3_++;
            }
         }
         return this._objectsSortedByDepth;
      }
      
      public function get tagCount() : uint
      {
         return this.tagIndexEnd - this.tagIndexStart + 1;
      }
      
      public function placeObject(param1:uint, param2:TagPlaceObject) : void
      {
         var _loc3_:FrameObject = this._objects[param2.depth] as FrameObject;
         if(_loc3_)
         {
            _loc3_._14730 = param2;
            if(param2.characterId == 0)
            {
               _loc3_.lastModifiedAtIndex = param1;
               _loc3_.isKeyframe = false;
            }
            else
            {
               _loc3_.lastModifiedAtIndex = 0;
               _loc3_.placedAtIndex = param1;
               _loc3_.isKeyframe = true;
               if(param2.characterId != _loc3_.characterId)
               {
                  _loc3_.characterId = param2.characterId;
               }
            }
         }
         else
         {
            this._objects[param2.depth] = new FrameObject(param2.depth,param2.characterId,param2.className,param1,0,true);
            this._objects[param2.depth]._14730 = param2;
         }
         this._objectsSortedByDepth = null;
      }
      
      public function removeObject(param1:TagRemoveObject) : void
      {
         delete this._objects[param1.depth];
         this._objectsSortedByDepth = null;
      }
      
      public function clone() : Frame
      {
         var _loc2_:String = null;
         var _loc1_:Frame = new Frame();
         for(_loc2_ in this._objects)
         {
            _loc1_._objects[_loc2_] = FrameObject(this._objects[_loc2_]).clone();
         }
         return _loc1_;
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = StringUtils.repeat(param1) + "[" + this.frameNumber + "] " + "Start: " + this.tagIndexStart + ", " + "Length: " + this.tagCount;
         if(this.label != null && this.label != "")
         {
            _loc2_ += ", Label: " + this.label;
         }
         if(this.characters.length > 0)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Defined CharacterIDs: " + this.characters.join(", ");
         }
         for(_loc3_ in this._objects)
         {
            _loc2_ += FrameObject(this._objects[_loc3_]).toString(param1);
         }
         return _loc2_;
      }
   }
}

