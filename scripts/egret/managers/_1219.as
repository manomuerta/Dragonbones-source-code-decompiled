package egret.managers
{
   import egret.core._1116;
   import egret.core._1133;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1219 implements _1116
   {
      private var owner:_1211;
      
      private var _9030:QName;
      
      private var _9031:QName;
      
      private var raw_getElementAt:QName;
      
      private var raw_addElementAt:QName;
      
      private var raw_getElementIndex:QName;
      
      private var raw_removeElement:QName;
      
      private var raw_removeElementAt:QName;
      
      private var raw_setElementIndex:QName;
      
      public function _1219(param1:_1211, param2:QName, param3:QName)
      {
         this.raw_getElementAt = new QName(ns_egret,"raw_getElementAt");
         this.raw_addElementAt = new QName(ns_egret,"raw_addElementAt");
         this.raw_getElementIndex = new QName(ns_egret,"raw_getElementIndex");
         this.raw_removeElement = new QName(ns_egret,"raw_removeElement");
         this.raw_removeElementAt = new QName(ns_egret,"raw_removeElementAt");
         this.raw_setElementIndex = new QName(ns_egret,"raw_setElementIndex");
         super();
         this.owner = param1;
         this._9030 = param2;
         this._9031 = param3;
      }
      
      public function get _2249() : int
      {
         return this.owner[this._9031] - this.owner[this._9030];
      }
      
      public function getElementAt(param1:int) : _1133
      {
         return this.owner[this.raw_getElementAt](this.owner[this._9030] + param1);
      }
      
      public function addElement(param1:_1133) : _1133
      {
         var _loc2_:int = int(this.owner[this._9031]);
         if(param1.parent == this.owner)
         {
            _loc2_--;
         }
         ++this.owner[this._9031];
         this.owner[this.raw_addElementAt](param1,_loc2_);
         param1._6967(this);
         return param1;
      }
      
      public function addElementAt(param1:_1133, param2:int) : _1133
      {
         ++this.owner[this._9031];
         this.owner[this.raw_addElementAt](param1,this.owner[this._9030] + param2);
         param1._6967(this);
         return param1;
      }
      
      public function removeElement(param1:_1133) : _1133
      {
         var _loc2_:int = int(this.owner[this.raw_getElementIndex](param1));
         if(this.owner[this._9030] <= _loc2_ && _loc2_ < this.owner[this._9031])
         {
            this.owner[this.raw_removeElement](param1);
            --this.owner[this._9031];
         }
         param1._6967(null);
         return param1;
      }
      
      public function removeElementAt(param1:int) : _1133
      {
         var _loc2_:_1133 = null;
         param1 += this.owner[this._9030];
         if(this.owner[this._9030] <= param1 && param1 < this.owner[this._9031])
         {
            _loc2_ = this.owner[this.raw_removeElementAt](param1);
            --this.owner[this._9031];
         }
         _loc2_._6967(null);
         return _loc2_;
      }
      
      public function getElementIndex(param1:_1133) : int
      {
         var _loc2_:int = int(this.owner[this.raw_getElementIndex](param1));
         return int(_loc2_ - this.owner[this._9030]);
      }
      
      public function setElementIndex(param1:_1133, param2:int) : void
      {
         this.owner[this.raw_setElementIndex](param1,this.owner[this._9030] + param2);
      }
   }
}

