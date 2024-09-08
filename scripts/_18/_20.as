package _18
{
   import _93._95;
   
   public class _20 extends _95
   {
      public var _1636:Array;
      
      protected var _isOpen:Boolean = true;
      
      protected var _1628:int = 0;
      
      protected var _1648:int = 0;
      
      protected var _1644:int = 0;
      
      protected var _1627:int = 0;
      
      protected var _1640:Boolean = false;
      
      protected var _1641:Boolean = false;
      
      public function _20()
      {
         this._1636 = [];
         super();
      }
      
      public function addAction(param1:IAction) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = int(this._1636.length);
         var _loc3_:IAction = this._1636[_loc2_ - 1];
         if(_loc3_ is DBActionGroup && (_loc3_ as DBActionGroup)._1643)
         {
            (_loc3_ as DBActionGroup).addAction(param1);
            this._1632();
            this._1633();
            this._1647();
            return;
         }
         if(_loc2_ > 0)
         {
            if(_loc3_._1639)
            {
               _loc3_.clearCache();
               if(_loc3_.merge(param1))
               {
                  return;
               }
               _loc3_._1639 = false;
            }
         }
         if(_loc2_ > this._1628 && param1._1631)
         {
            _loc4_ = _loc2_ - 1;
            while(_loc4_ >= this._1628)
            {
               if((this._1636[_loc4_] as IAction)._1631)
               {
                  this._1636.splice(_loc4_,1);
               }
               _loc4_--;
            }
            if(this._1649 > this._1628)
            {
               this._1649 = -1;
            }
         }
         this._1636.push(param1);
         if(_loc2_ == this._1628 || param1._1631)
         {
            this.currentPosition = this._1636.length;
            this._1645 = 0;
         }
         if(param1._1631)
         {
            ++this._1646;
         }
         else if(this._1649 == _loc2_)
         {
            ++this._1649;
         }
      }
      
      public function undo() : void
      {
         var _loc1_:IAction = null;
         var _loc3_:Boolean = false;
         var _loc4_:DBActionGroup = null;
         var _loc2_:int = 0;
         if(this._1643)
         {
            _loc2_ = this._1628 - 1;
            while(_loc2_ >= 0)
            {
               _loc1_ = this._1636[_loc2_];
               if(_loc1_._1631)
               {
                  _loc1_._1639 = false;
                  if(_loc1_ is DBActionGroup)
                  {
                     _loc3_ = (_loc1_ as DBActionGroup)._1643;
                  }
                  _loc1_.undo();
                  if(!(_loc1_ is DBActionGroup) || !(_loc1_ as DBActionGroup)._1653)
                  {
                     this.currentPosition = _loc2_;
                     --this._1646;
                     ++this._1645;
                     if(_loc1_ is DBActionGroup)
                     {
                        _loc4_ = _loc1_ as DBActionGroup;
                        if(_loc4_._1628 == 0 && _loc3_)
                        {
                           this._1636.splice(_loc2_,1);
                           --this._1645;
                        }
                     }
                  }
                  return;
               }
               _loc2_--;
            }
         }
         else
         {
            _loc2_ = int(this._1636.length - 1);
            while(_loc2_ >= 0)
            {
               _loc1_ = this._1636[_loc2_];
               if(_loc1_._1631)
               {
                  _loc1_.undo();
               }
               _loc2_--;
            }
         }
      }
      
      public function redo() : void
      {
         var _loc1_:IAction = null;
         var _loc2_:int = 0;
         var _loc4_:Boolean = false;
         var _loc3_:int = int(this._1636.length);
         if(this._1643)
         {
            _loc4_ = false;
            _loc2_ = this._1628;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._1636[_loc2_] as IAction;
               if(_loc1_._1631)
               {
                  if(_loc4_)
                  {
                     this.currentPosition = _loc2_;
                     return;
                  }
                  _loc4_ = true;
                  _loc1_.redo();
                  if(!(_loc1_ is DBActionGroup) || !(_loc1_ as DBActionGroup)._1654)
                  {
                     ++this._1646;
                     --this._1645;
                  }
               }
               _loc2_++;
            }
            this.currentPosition = _loc3_;
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._1636[_loc2_];
               if(_loc1_._1631)
               {
                  _loc1_.redo();
               }
               _loc2_++;
            }
         }
      }
      
      public function _1651() : void
      {
         if(this._1636.length > 0)
         {
            (this._1636[this._1636.length - 1] as IAction)._1639 = false;
         }
      }
      
      public function _1652() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = int(this._1636.length);
         var _loc2_:IAction = this._1636[_loc1_ - 1];
         if(_loc2_ is DBActionGroup && (_loc2_ as DBActionGroup)._1643)
         {
            (_loc2_ as DBActionGroup)._1652();
         }
         else
         {
            if(_loc1_ > this._1628)
            {
               _loc3_ = _loc1_ - 1;
               while(_loc3_ >= this._1628)
               {
                  if((this._1636[_loc3_] as IAction)._1631)
                  {
                     this._1636.splice(_loc3_,1);
                  }
                  _loc3_--;
               }
            }
            this._1643 = false;
         }
      }
      
      public function _1650() : void
      {
         var _loc1_:int = int(this._1636.length);
         var _loc2_:IAction = this._1636[_loc1_ - 1];
         if(_loc2_ is DBActionGroup && (_loc2_ as DBActionGroup)._1643)
         {
            --this._1646;
            --this.currentPosition;
            (_loc2_ as DBActionGroup)._1652();
            (_loc2_ as DBActionGroup).undo();
            this._1636.pop();
         }
      }
      
      protected function _1632() : void
      {
         this._1640 = this._1643 && this._1644 > 0;
      }
      
      protected function _1633() : void
      {
         var _loc1_:IAction = null;
         this._1641 = this._1643;
         if(this._1643)
         {
            this._1641 = this._1627 > 0;
            if(!this._1641)
            {
               _loc1_ = this._1636[this._1636.length - 1];
               this._1641 = _loc1_ is DBActionGroup ? (_loc1_ as DBActionGroup)._1654 : false;
            }
         }
      }
      
      protected function _1647() : void
      {
      }
      
      public function get _1643() : Boolean
      {
         return this._isOpen;
      }
      
      public function set _1643(param1:Boolean) : void
      {
         if(this._isOpen != param1)
         {
            this._isOpen = param1;
            this._1632();
            this._1633();
         }
      }
      
      public function get _1653() : Boolean
      {
         return this._1640;
      }
      
      public function get _1654() : Boolean
      {
         return this._1641;
      }
      
      protected function get _1646() : Number
      {
         return this._1644;
      }
      
      protected function set _1646(param1:Number) : void
      {
         this._1644 = param1;
         this._1632();
      }
      
      protected function get _1645() : Number
      {
         return this._1627;
      }
      
      protected function set _1645(param1:Number) : void
      {
         if(this._1627 != param1)
         {
            this._1627 = param1;
            this._1633();
         }
      }
      
      protected function get currentPosition() : Number
      {
         return this._1628;
      }
      
      protected function set currentPosition(param1:Number) : void
      {
         if(this._1628 != param1)
         {
            this._1628 = param1;
            this._1647();
         }
      }
      
      protected function get _1649() : Number
      {
         return this._1648;
      }
      
      protected function set _1649(param1:Number) : void
      {
         if(this._1648 != param1)
         {
            this._1648 = param1;
            this._1647();
         }
      }
   }
}

