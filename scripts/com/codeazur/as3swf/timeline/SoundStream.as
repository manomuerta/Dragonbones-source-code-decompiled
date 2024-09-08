package com.codeazur.as3swf.timeline
{
   import flash.utils.ByteArray;
   
   public class SoundStream
   {
      public var startFrame:uint;
      
      public var numFrames:uint;
      
      public var numSamples:uint;
      
      public var _15073:uint;
      
      public var compression:uint;
      
      public var rate:uint;
      
      public var size:uint;
      
      public var type:uint;
      
      public var _15092:int;
      
      public var _15094:int;
      
      protected var _data:ByteArray;
      
      protected var _15093:Array;
      
      public function SoundStream()
      {
         super();
         this._data = new ByteArray();
         this._15093 = new Array();
      }
      
      public function get data() : ByteArray
      {
         return this._data;
      }
      
      public function get _15074() : Array
      {
         return this._15093;
      }
      
      public function toString() : String
      {
         return "[SoundStream] " + "StartFrame: " + this.startFrame + ", " + "Frames: " + this.numFrames + ", " + "Samples: " + this.numSamples + ", " + "Bytes: " + this.data.length;
      }
   }
}

