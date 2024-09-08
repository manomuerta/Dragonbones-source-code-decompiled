package _1413
{
   import _1409._1411;
   import _1421.FTETextEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class _1412
   {
      private var _9956:_1411;
      
      private var _9955:int = -1;
      
      private var _9949:Array;
      
      private var _9952:int = 0;
      
      private var _9954:Vector.<Vector.<_1414>>;
      
      private var _9946:int = -1;
      
      public function _1412()
      {
         this._9949 = [];
         this._9954 = new Vector.<Vector.<_1414>>();
         super();
      }
      
      public function init(param1:_1411) : void
      {
         this._9956 = param1;
         this._9956.addEventListener(FTETextEvent.FTE_TEXT_CHANGED,this._9947);
      }
      
      protected function _9947(param1:FTETextEvent) : void
      {
         if(!param1._9915)
         {
            return;
         }
         if(param1._9924 == param1._9937 && param1._9927 == param1._9940 && param1._9931 == "" && param1._9941 == "")
         {
            return;
         }
         var _loc2_:_1414 = new _1414();
         _loc2_._9948 = param1._9924;
         _loc2_._9951 = param1._9937;
         _loc2_._9931 = param1._9931;
         _loc2_._9950 = param1._9927;
         _loc2_._9953 = param1._9940;
         _loc2_._9941 = param1._9941;
         this._9949.push(_loc2_);
         if(_loc2_._9948 != _loc2_._9951)
         {
            this._9915();
         }
         else if(_loc2_._9941.length == 1 && (_loc2_._9941 == " " || _loc2_._9941.charCodeAt(0) == 9 || _loc2_._9941 == "\r" || _loc2_._9941 == "\n"))
         {
            this._9915();
         }
         else if(_loc2_._9941.length > 1)
         {
            this._9915();
         }
      }
      
      private function _9915(param1:Boolean = false) : void
      {
         if(param1)
         {
            if(this._9955 != -1)
            {
               clearTimeout(this._9955);
            }
            this._9945();
         }
         else
         {
            if(this._9955 != -1)
            {
               clearTimeout(this._9955);
            }
            this._9955 = setTimeout(this._9945,200);
         }
      }
      
      private function _9945() : void
      {
         var _loc2_:_1414 = null;
         var _loc3_:int = 0;
         var _loc4_:_1414 = null;
         var _loc5_:_1414 = null;
         var _loc1_:Vector.<_1414> = new Vector.<_1414>();
         if(this._9949.length > 0)
         {
            if(this._9952 < this._9954.length)
            {
               this._9954.length = this._9952;
            }
            _loc3_ = 0;
            while(_loc3_ < this._9949.length)
            {
               _loc4_ = this._9949[_loc3_];
               if(_loc3_ == 0 && this._9949.length == 1)
               {
                  _loc2_ = new _1414();
                  _loc2_._9948 = _loc4_._9948;
                  _loc2_._9951 = _loc4_._9951;
                  _loc2_._9931 = _loc4_._9931;
                  _loc2_._9950 = _loc4_._9950;
                  _loc2_._9953 = _loc4_._9953;
                  _loc2_._9941 = _loc4_._9941;
                  _loc1_.push(_loc2_);
               }
               else if(_loc3_ == 0)
               {
                  _loc2_ = new _1414();
                  _loc2_._9948 = _loc4_._9948;
                  _loc2_._9951 = _loc4_._9951;
                  _loc2_._9931 = _loc4_._9931;
                  _loc2_._9950 = _loc4_._9950;
                  _loc2_._9953 = _loc4_._9953;
                  _loc2_._9941 = _loc4_._9941;
               }
               else if(_loc3_ < this._9949.length - 1)
               {
                  _loc5_ = this._9949[_loc3_ - 1];
                  if(_loc4_._9941.length == 1 && _loc4_._9948 == _loc4_._9951 && _loc4_._9951 == _loc5_._9953)
                  {
                     ++_loc2_._9953;
                     _loc2_._9941 += _loc4_._9941;
                  }
                  else
                  {
                     _loc1_.push(_loc2_);
                     _loc2_ = new _1414();
                     _loc2_._9948 = _loc4_._9948;
                     _loc2_._9951 = _loc4_._9951;
                     _loc2_._9931 = _loc4_._9931;
                     _loc2_._9950 = _loc4_._9950;
                     _loc2_._9953 = _loc4_._9953;
                     _loc2_._9941 = _loc4_._9941;
                  }
               }
               else if(_loc3_ == this._9949.length - 1)
               {
                  _loc5_ = this._9949[_loc3_ - 1];
                  if(_loc4_._9941.length == 1 && _loc4_._9948 == _loc4_._9951 && _loc4_._9951 == _loc5_._9953)
                  {
                     ++_loc2_._9953;
                     _loc2_._9941 += _loc4_._9941;
                     _loc1_.push(_loc2_);
                  }
                  else
                  {
                     _loc1_.push(_loc2_);
                     _loc2_ = new _1414();
                     _loc2_._9948 = _loc4_._9948;
                     _loc2_._9951 = _loc4_._9951;
                     _loc2_._9931 = _loc4_._9931;
                     _loc2_._9950 = _loc4_._9950;
                     _loc2_._9953 = _loc4_._9953;
                     _loc2_._9941 = _loc4_._9941;
                     _loc1_.push(_loc2_);
                  }
               }
               _loc3_++;
            }
            this._9954.push(_loc1_);
            this._9952 = this._9954.length;
         }
         this._9949 = [];
      }
      
      public function undo() : void
      {
         var _loc1_:Vector.<_1414> = null;
         var _loc2_:int = 0;
         this._9915(true);
         if(this._9321())
         {
            --this._9952;
            _loc1_ = this._9954[this._9952];
            _loc2_ = int(_loc1_.length - 1);
            while(_loc2_ >= 0)
            {
               this._9956.replaceText(_loc1_[_loc2_]._9950,_loc1_[_loc2_]._9953,_loc1_[_loc2_]._9931,false,false);
               _loc2_--;
            }
         }
      }
      
      public function redo() : void
      {
         var _loc1_:Vector.<_1414> = null;
         var _loc2_:int = 0;
         this._9915(true);
         if(this._9320())
         {
            _loc1_ = this._9954[this._9952];
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               this._9956.replaceText(_loc1_[_loc2_]._9948,_loc1_[_loc2_]._9951,_loc1_[_loc2_]._9941,false,false);
               _loc2_++;
            }
            ++this._9952;
         }
      }
      
      public function _9321() : Boolean
      {
         return this._9952 > 0;
      }
      
      public function _9320() : Boolean
      {
         return this._9952 < this._9954.length;
      }
      
      public function _9944() : void
      {
         this._9952 = 0;
         this._9954.length = 0;
         this._9949 = [];
      }
   }
}

