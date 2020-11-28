import { BigInt, Address } from "@graphprotocol/graph-ts"
import {
  YourContract,
  SetPurpose
} from "../generated/YourContract/YourContract"
import { ProjectMinted } from "../generated/ProjectContract/ProjectContract"
import { Purpose, Sender, Project, Owner } from "../generated/schema"

export function handleSetPurpose(event: SetPurpose): void {

  let senderString = event.params.sender.toHexString()

  let sender = Sender.load(senderString)

  if (sender == null) {
    sender = new Sender(senderString)
    sender.address = event.params.sender
    sender.createdAt = event.block.timestamp
    sender.purposeCount = BigInt.fromI32(1)
  }
  else {
    sender.purposeCount = sender.purposeCount.plus(BigInt.fromI32(1))
  }

  let purpose = new Purpose(event.transaction.hash.toHex() + "-" + event.logIndex.toString())

  purpose.purpose = event.params.purpose
  purpose.sender = senderString
  purpose.createdAt = event.block.timestamp
  purpose.transactionHash = event.transaction.hash.toHex()

  purpose.save()
  sender.save()

}

export function handleProjectMinted(event: ProjectMinted): void {

  let ownerString = event.params.to.toHexString()

  let owner = Owner.load(ownerString)

  if (owner == null) {
    owner = new Owner(ownerString)
    owner.address = event.params.to
    owner.createdAt = event.block.timestamp
    owner.projectCount = BigInt.fromI32(1)
  }
  else {
    owner.projectCount = owner.projectCount.plus(BigInt.fromI32(1))
  }

  let project = new Project(event.transaction.hash.toHex() + "-" + event.logIndex.toString())

  project.to = event.params.to
  project.owner = ownerString
  project.createdAt = event.block.timestamp
  project.transactionHash = event.transaction.hash.toHex()

  project.save()
  owner.save()
  

}